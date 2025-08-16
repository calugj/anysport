import Toybox.ActivityRecording;
import Toybox.Application;
import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.System;
import Toybox.Sensor;
import Toybox.Timer;
import Toybox.Position;
import Toybox.SensorHistory;


public class SportData {

    private static var instance as SportData?;

    private static var timer as Timer.Timer?;
    
    public var sport as Number;

    private var info as Activity.Info?;
    private var sensor as Sensor.Info?;

    private var session as ActivityRecording.Session?;
    private var isStarted as Boolean;
    private var lapTimestamp as Number;
    private var lastLapTime as Number;
    private var lapDistanceStamp as Float;
    private var lastLapDistance as Float;
    private var avgLapTime as Number;
    private var lapCount as Number;
    private var lapTime as Number;
    private var lapDistance as Float;

    public var setRing as Number;
    private var autoPausedByAutopause as Boolean;


    public static function getInstance() as SportData? {
        if(instance == null) {
            instance = new SportData();
        }
        return instance;
    }

    public function initialize() {
        session = null;
        isStarted = false;
        setRing = 0;
        autoPausedByAutopause = false;

        lapTimestamp = 0;
        lastLapTime = 0;
        lapDistanceStamp = 0.0;
        lastLapDistance = 0.0;
        lapTime = 0;
        lapDistance = 0.0;
        avgLapTime = 0;
        lapCount = 0;

        sport = 0;

        if(SportData.timer == null) {
            SportData.timer = new Timer.Timer();
            SportData.timer.start(method(:update), 1000, true);
        }
        
        create();
        update();

        var positioning = Properties.getValue("Satellites") as Number;
        if(positioning == 0) {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_DISABLE}, null);
        } else {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_CONTINUOUS, :configuration => positioning as Position.Configuration}, null);
        }

        setSensors();
    }


    public function update() as Void {
        info = Activity.getActivityInfo();
        sensor = Sensor.getInfo();

        if(info != null && info.timerTime != null) {
            var timerTime = info.timerTime as Number;
            lapTime = timerTime - lapTimestamp;
        }
        if(info != null && info.elapsedDistance != null) {
            var elapsedDistance = info.elapsedDistance as Float;
            lapDistance = elapsedDistance - lapDistanceStamp;
        }

        // Autopause
        if(Properties.getValue("Autopause") as Boolean && isStarted && info != null && info.currentSpeed != null) {
            var currentSpeed = info.currentSpeed as Float;
            if(isRecording() && currentSpeed == 0) {
                stop();
                setRing = 1;
                autoPausedByAutopause = true;
            } else if (!isRecording() && autoPausedByAutopause && currentSpeed > 0) {
                start();
                setRing = 2;
            }            
        }

        // AutoLap: check if the lap distance exceeds the autolap value
        if(Properties.getValue("AutoLapActivated") as Boolean && isStarted  && Properties.getValue("LapActivated") as Boolean) {
            var autoLapValue = Properties.getValue("AutoLapValue") as Float;
            var unit = Properties.getValue("DistanceUnits") as Number;
            if(isNauticalActivity()) {
                unit = Properties.getValue("NauticalUnits") as Number;
            }

            if(unit == System.UNIT_METRIC) {
                autoLapValue *= 1000;
            } else if(unit == System.UNIT_STATUTE) {
                autoLapValue *= 1609.344;
            } else {
                autoLapValue *= 1852;
            }

            if(lapDistance >= autoLapValue) {
                lap();
                setRing = 3;
            }
        }
    }


    public function isRecording() as Boolean {
        if(session != null) {
            return session.isRecording();
        }
        return false;
    }


    public function isRecordingStarted() as Boolean {
        return isStarted;
    }


    public function create() as Void {
        var name = Properties.getValue("Name") as String;
        sport = Properties.getValue("Sport") as Number;
        var subSport = Properties.getValue("SubSport") as Number;


        if(!isStarted) {
            session = ActivityRecording.createSession({
                 :name=>name as String,
                 :sport=>sport as Activity.Sport,
                 :subSport=>subSport as Activity.SubSport,
           });
        }
    }


    public function start() as Boolean {
        if(!isRecording()) {
            isStarted = true;
            if(System.getDeviceSettings().vibrateOn) {
                Attention.vibrate([
                    new Attention.VibeProfile(50, 1000),
                ]);
            }
            if(Attention has :playTone && System.getDeviceSettings().tonesOn) {
                Attention.playTone(Attention.TONE_START);
            }
            autoPausedByAutopause = false;
            if(session != null) {
                return session.start();
            }
        }
        return false;
    }


    public function stop() as Boolean {
        if(session != null && isRecording()) {
            if(System.getDeviceSettings().vibrateOn) {
                Attention.vibrate([
                    new Attention.VibeProfile(50, 1000),
                ]);
            }
            if(Attention has :playTone && System.getDeviceSettings().tonesOn) {
                Attention.playTone(Attention.TONE_STOP);
            }
            if(session != null) {
                return session.stop();
            }
        }
        return false;
    }


    public function save() as Boolean {
        if(session != null && isStarted && !isRecording()) {
            var retVal = false;
            if(session != null) {
                retVal = session.save();
            }
            
            initialize();
            return retVal;
        }
        return false;
    }


    public function lap() as Boolean {
        if(Properties.getValue("LapActivated") as Boolean && session != null && isStarted && isRecording()) {
            if(info != null) {
                if(info.timerTime != null) {
                    var timerTime = info.timerTime as Number;
                    lastLapTime = timerTime - lapTimestamp;
                    lapTimestamp = timerTime;
                    avgLapTime = (avgLapTime*lapCount + lastLapTime) / (lapCount + 1);
                }
                
                if(info.elapsedDistance != null) {
                    var elapsedDistance = info.elapsedDistance as Float;
                    lastLapDistance = elapsedDistance - lapDistanceStamp;
                    lapDistanceStamp = elapsedDistance;
                }
            }
            lapCount += 1;
            if(System.getDeviceSettings().vibrateOn) {
                Attention.vibrate([new Attention.VibeProfile(50, 1000)]);
            }
            if(Attention has :playTone && System.getDeviceSettings().tonesOn) {
                Attention.playTone(Attention.TONE_LAP);
            }
            if(session != null) {
                return session.addLap();
            }
        }
        return false;
    }


    public function discard() as Boolean {
        if(session != null && isStarted && !isRecording()) {
            if(System.getDeviceSettings().vibrateOn) {
                Attention.vibrate([
                    new Attention.VibeProfile(100, 166),
                    new Attention.VibeProfile(66, 166),
                    new Attention.VibeProfile(33, 166)
                ]);
            }
            if(Attention has :playTone && System.getDeviceSettings().tonesOn) {
                Attention.playTone(Attention.TONE_RESET);
            }
            var retVal = false;
            if(session != null) {
                retVal = session.discard();
            }
            initialize();
            return retVal;
        }
        return false;
    }


    public function setSensors() as Void {
        Sensor.setEnabledSensors([
            Sensor.SENSOR_BIKESPEED,
            Sensor.SENSOR_BIKECADENCE,
            Sensor.SENSOR_BIKEPOWER,
            Sensor.SENSOR_FOOTPOD,
            Sensor.SENSOR_HEARTRATE,
            Sensor.SENSOR_TEMPERATURE,
            Sensor.SENSOR_ONBOARD_HEARTRATE
        ]);
    }



    public function getMetric(request as Number) as Array<String> {
        if(
            info == null ||
            [25, 26].indexOf(request) != -1 && sensor == null   // If requires Sensor, and value is null
        ) {
            return ["0", "null"];
        }

        
        switch(request) {
            case 0: // timer
                return [formatTime(info.timerTime as Number?), Strings.getString("Timer")] as Array<String>;
            case 1: // lap timer
                return [formatTime(lapTime), Strings.getString("LapTimer")] as Array<String>;
            case 2: // last lap
                return [formatTime(lastLapTime), Strings.getString("LastLapTimer")] as Array<String>;
            case 3: // avg lap time
                return [formatTime(avgLapTime), Strings.getString("AverageLap")] as Array<String>;
            case 4: // elapsed time
                if(info.startTime == null) {
                    return ["00:00", Strings.getString("ElapsedTime")] as Array<String>;
                }
                return [formatTime(Time.now().subtract(info.startTime).value() * 1000), Strings.getString("ElapsedTime")] as Array<String>;
            case 5: // distance
                return [formatDistance(info.elapsedDistance as Float?), Strings.getString("Distance")] as Array<String>;
            case 6: // lap distance
                return [formatDistance(lapDistance), Strings.getString("LapDistance")] as Array<String>;
            case 7: // last lap distance
                return [formatDistance(lastLapDistance), Strings.getString("LastLapDistance")] as Array<String>;
            case 8: // pace
                return [formatPace(info.currentSpeed as Float?), Strings.getString("Pace")] as Array<String>;
            case 9: // average pace
                if(info.timerTime == null || info.elapsedDistance == null) {
                    return ["--:--", Strings.getString("AveragePace")] as Array<String>;
                }
                return [formatPace(1000f*info.elapsedDistance/info.timerTime), Strings.getString("AveragePace")] as Array<String>;
            case 10: // average lap pace
                if(lapTime <= 0) {
                    return ["--:--", Strings.getString("AverageLapPace")] as Array<String>;
                }
                return [formatPace( 1000f*lapDistance.toFloat()/lapTime.toFloat() ), Strings.getString("AverageLapPace")] as Array<String>;
            case 11: // last lap pace
                if(lastLapTime <= 0) {
                    return ["--:--", Strings.getString("LastLapPace")] as Array<String>;
                }
                return [formatPace( 1000f*lastLapDistance/lastLapTime ), Strings.getString("LastLapPace")] as Array<String>;
            case 12: // max pace
                return [formatPace(info.maxSpeed as Float?), Strings.getString("MaxPace")] as Array<String>;
            case 13: // speed
                return [formatSpeed(info.currentSpeed as Float?), Strings.getString("Speed")] as Array<String>;
            case 14: // average speed
                if(info.timerTime == null || info.elapsedDistance == null) {
                    return ["0.0", Strings.getString("AverageSpeed")] as Array<String>;
                }
                return [formatSpeed(1000f*info.elapsedDistance/info.timerTime), Strings.getString("AverageSpeed")] as Array<String>;
            case 15: // average lap speed
                if(lapTime <= 0) {
                    return ["0.0", Strings.getString("AverageLapSpeed")] as Array<String>;
                }
                return [formatSpeed( 1000f*lapDistance.toFloat()/lapTime.toFloat() ), Strings.getString("AverageLapSpeed")] as Array<String>;
            case 16: // last lap speed
                if(lastLapTime <= 0) {
                    return ["--:--", Strings.getString("LastLapSpeed")] as Array<String>;
                }
                return [formatSpeed( (1000f*lastLapDistance/lastLapTime) ), Strings.getString("LastLapSpeed")] as Array<String>;
            case 17: // max speed
                return [formatSpeed(info.maxSpeed as Float?), Strings.getString("MaxSpeed")] as Array<String>;
            case 18: // heart rate
                return [formatValue(info.currentHeartRate as Number?, "%.1d"), Strings.getString("HeartRate")] as Array<String>;
            case 31: // heart rate graphical
                return [formatValue(info.currentHeartRate as Number?, "%.1d"), Strings.getString("HeartRateColor")] as Array<String>;
            case 19: // average heart rate
                return [formatValue(info.averageHeartRate as Number?, "%.1d"), Strings.getString("AverageHeartRate")] as Array<String>;
            case 20: // max heart rate
                return [formatValue(info.maxHeartRate as Number?, "%.1d"), Strings.getString("MaxHeartRate")] as Array<String>;
            case 21: // temperature
                var sensorSample = SensorHistory.getTemperatureHistory({:period => 1}).next();
                var value = null;
                if(sensorSample != null) {
                    value = sensorSample.data as Float?;
                }
                return [formatValue(value, "%.1f"), Strings.getString("Temperature")] as Array<String>;
            case 22: // altitude
                return [formatDistance(info.altitude as Float?), Strings.getString("Altitude")] as Array<String>;
            case 23: // total ascent
                return [formatDistance(info.totalAscent as Number?), Strings.getString("TotalAscent")] as Array<String>;
            case 24: // total descent
                return [formatDistance(info.totalDescent as Number?), Strings.getString("TotalDescent")] as Array<String>;
            case 25: // compass
                var heading = null;
                if(sensor.heading != null) {
                    heading = sensor.heading*180f/Math.PI as Float;
                }
                return [formatValue(heading, "%.1f"), Strings.getString("Compass")] as Array<String>;
            case 26: // cadence
                return [formatValue(sensor.cadence as Number?, "%.1d"), Strings.getString("Cadence")] as Array<String>;
            case 27: // calories
                return [formatValue(info.calories as Number?, "%.1d"), Strings.getString("Calories")] as Array<String>;
            case 28: // battery
                return [formatValue(System.getSystemStats().battery, "%.1f"), Strings.getString("Battery")] as Array<String>;
            case 29: // lapCount
                return [formatValue(lapCount as Float, "%.1d"), Strings.getString("LapCount")] as Array<String>;
            case 30: // time of day
                var time = System.getClockTime();
                var seconds = time.hour*3600 + time.min * 60 + time.sec;
                return [formatTime(seconds*1000), Strings.getString("TimeOfDay")] as Array<String>;
            case 32: // power
                return [formatValue(info.currentPower as Number?, "%.1d"), Strings.getString("Power")] as Array<String>;
            case 33: // raw pressure
                var rawPressure = null;
                if(info.rawAmbientPressure != null) {
                    rawPressure = info.rawAmbientPressure/100f as Float;
                }
                return [formatValue(rawPressure, "%.1d"), Strings.getString("RawPressure")] as Array<String>;
            case 34: // sea pressure
                var seaPressure = null;
                if(info.meanSeaLevelPressure != null) {
                    seaPressure = info.meanSeaLevelPressure/100f as Float;
                }
                return [formatValue(seaPressure, "%.1d"), Strings.getString("SeaPressure")] as Array<String>;
        }

        return ["--", "null"];
    }





    //                      |
    // Format functions     |
    //                      V

    private function formatTime(param_time as Number?) as String {
        if(param_time == null || param_time == 0) {
            return "00:00";
        }
        var timerSeconds = param_time/1000;
    	var timerMinutes  = timerSeconds/60;
    	var timerHours = timerMinutes/60;
    	var timerSecondsNormalized = timerSeconds - (timerMinutes * 60);
    	var timerMinutesNormalized = timerMinutes - (timerHours * 60);
    	if(timerMinutesNormalized < 10) {
    		timerMinutesNormalized = "0" + timerMinutesNormalized as String;
    	}
        if(timerSecondsNormalized < 10) {
    		timerSecondsNormalized = "0" + timerSecondsNormalized as String;
    	}

    	if (timerHours < 1) {
    		return (timerMinutesNormalized + ":" + timerSecondsNormalized);
    	}
    	return(timerHours + ":" + timerMinutesNormalized + ":" + timerSecondsNormalized);
    }


    private function formatDistance(param_distance as Float?) as String {
        if(param_distance == null || param_distance <= 0) {
    		return "0";
    	}
        
        var unit = Properties.getValue("DistanceUnits") as Number;
        if(isNauticalActivity()) {
            unit = Properties.getValue("NauticalUnits") as Number;
        }

        if(unit == System.UNIT_METRIC) {
            if(param_distance < 1000) {
                return(param_distance.toNumber().toString());
            }
            return (param_distance/1000.0d).format("%.2f").toString();
        }
        else if(unit == System.UNIT_STATUTE) {
            if(param_distance < 1609.34) {
                return((param_distance * 1.09361).toNumber().toString());
            }
            return (param_distance * 0.000621371d).format("%.2f").toString();
        }
        else { // nautical miles
            return (param_distance * 0.000539957d).format("%.2f").toString();
        }
    }


    private function formatPace(param_speed as Float?) as String {
        if(param_speed == null || param_speed < 0.5) {
    		return "--:--";
    	}

        var unit = Properties.getValue("PaceUnits") as Number;

        if(unit == System.UNIT_STATUTE) {
    		param_speed = 60/(param_speed*2.23694);
    	} else {
    		param_speed = 60.0/(param_speed*3.6);
    	}
		
        var paceMin = Math.floor(param_speed).toNumber();
        var paceSec = ((param_speed-paceMin)*60).toNumber();
       	if(paceSec < 10) {
        	paceSec = "0" + paceSec.toString();
        }
        return(paceMin.toString() + ":" + paceSec.toString());
    }


    private function formatSpeed(param_speed as Float?) as String {
        if(param_speed == null || param_speed <= 0) {
    		return "0.0";
    	}

        var unit = Properties.getValue("SpeedUnits") as Number;
        if(isNauticalActivity()) {
            unit = Properties.getValue("NauticalUnits") as Number;
        }

        if(unit == System.UNIT_METRIC) {
            return (param_speed * 3.6).format("%.1f").toString();
        } else if(unit == System.UNIT_STATUTE) {
            return (param_speed * 2.23694).format("%.1f").toString();
        } else { // knots
            return (param_speed * 1.943844).format("%.1f").toString();
        }
    }


    private function formatTemperature(param_temperature as Float?) as String {
        if(param_temperature == null || param_temperature <= 0) {
    		return "--";
    	}

        var unit = Properties.getValue("TemperatureUnits") as Number;

        if(unit == System.UNIT_METRIC) {
            return (param_temperature).format("%.1f").toString();
        }

        return ((param_temperature * 1.8) + 32).format("%.1f").toString();
    }


    private function formatValue(param_value as Float?, param_format as String) as String {
        if(param_value == null) {
    		return "--";
    	}

        return (param_value).format(param_format).toString();
    }


    private function getNauticalActivities() as Array<Number> {
        return [32, 39, 43, 44, 77, 23];
    }

    public function isNauticalActivity() as Boolean {
        return getNauticalActivities().indexOf(sport as Number) != -1;
    }

}