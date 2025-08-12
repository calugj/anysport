import Toybox.Lang;
import Toybox.System;

/*
    This class serves the purpose of holding more 
    strings than the max limit on the resource file
*/
public class Strings {

    private static var instance;
    private var dictionary;

    public static function getInstance() as Strings {
        if(instance == null) {
            instance = new Strings();
        }
        return instance;
    }

    public function initialize() {
        var lang = System.getDeviceSettings().systemLanguage;
        
        switch(lang) {
            case System.LANGUAGE_ENG:
                get_ENG();
                break;
            default:
                get_ENG();
        }
    }

    public function getString(index as String) as String {
        var retVal = dictionary.get(index);
        if(retVal == null) {
            return "";
        }
        return retVal as String;
    }

    private function get_ENG() as Void {
        dictionary = {
            "COLOR_WHITE" => "White",
            "COLOR_LT_GRAY" => "Light gray",
            "COLOR_DK_GRAY" => "Dark gray",
            "COLOR_BLACK" => "Black",
            "COLOR_RED" => "Red",
            "COLOR_DK_RED" => "Dark red",
            "COLOR_ORANGE" => "Orange",
            "COLOR_YELLOW" => "Yellow",
            "COLOR_GREEN" => "Green",
            "COLOR_DK_GREEN" => "Dark green",
            "COLOR_BLUE" => "Blue",
            "COLOR_DK_BLUE" => "Dark blue",
            "COLOR_PURPLE" => "Purple",
            "COLOR_PINK" => "Pink",
            "COLOR_TRANSPARENT" => "Invisible",
            "2EUR" => "2 EUR",
            "2EURSub" => "Small gesture, big heart",
            "5EUR" => "5 EUR",
            "5EURSub" => "A meaningful support",
            "10EUR" => "10 EUR",
            "10EURSub" => "A generous contribution",
            "CustomEUR" => "Custom amount",
            "CustomEURSub" => "Give what you want",
            "FreeEUR" => "0 EUR - Free use",
            "FreeEURSub" => "I will still love you!",
            "ReadAll" => "Scroll to the\nbottom and confirm.\n\n",
            "DonationDialog" => "I truly thank you\nfor your help!\n\nCheck your phone",
            "DivingDialog" => "Deep diving requires\nmilitar grade\nwaterproofing.\nMost watches\ndon't offer militar\ngrade waterproofing.\nBy continuing, you\naccept the risks.",
            "FlyingDialog" => "This product\nshould not be\nused as a primary\ninformation source\nfor aviation.\nBy continuing, you\naccept the risks.",
            "LicensesDialog" => "This product is\nlicensed under the\nGNU GPL V3.0.\n\nThis product\nincludes the\nfollowing resources,\ndistributed under the\nApache License V2.0:\nMaterial Design Icons\nby Google.",
            "Autopause" => "Autopause",

            "Timer" => "Timer",
            "LapTimer" => "Lap timer",
            "LastLapTimer" => "Last lap",
            "AverageLap" => "Average lap time",
            "ElapsedTime" => "Elapsed time",
            "Distance" => "Distance",
            "LapDistance" => "Lap distance",
            "LastLapDistance" => "Last lap distance",
            "Pace" => "Pace",
            "AveragePace" => "Average pace",
            "AverageLapPace" => "Average lap pace",
            "LastLapPace" => "Last lap pace",
            "MaxPace" => "Max pace",
            "Speed" => "Speed",
            "AverageSpeed" => "Average speed",
            "AverageLapSpeed" => "Average lap speed",
            "LastLapSpeed" => "Last lap speed",
            "MaxSpeed" => "Max speed",
            "HeartRate" => "Heart rate",
            "HeartRateColor" => "HR indicator",
            "AverageHeartRate" => "Average HR",
            "ZoneHeartRate" => "Zone HR",
            "TrainingEffect" => "Training effect",
            "PercentMaxHeartRate" => "% Max HR",
            "PercentMaxAverageHeartRate" => "% Max avg HR",
            "AverageLapHeartRate" => "Average lap HR",
            "PercentMaxAverageLapHeartRate" => "% Max avg lap HR",
            "LastLapHeartRate" => "Last lap HR",
            "PercentMaxLastLapHeartRate" => "% Max last lap HR",
            "MaxHeartRate" => "Max HR",
            "Temperature" => "Temperature",
            "Altitude" => "Altitude",
            "TotalAscent" => "TotalAscent",
            "TotalDescent" => "TotalDescent",
            "Compass" => "Compass",
            "Cadence" => "Cadence",
            "Calories" => "Calories",
            "Battery" => "Battery",
            "LapCount" => "Lap count",
            "TimeOfDay" => "Clock",
            "Power" => "Power",
            "RawPressure" => "Raw pressure",
            "SeaPressure" => "Sea pressure",
        };
    }
}