import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Sensor;
import Toybox.Communications;
import Toybox.Position;

public class AnySportPRO extends Application.AppBase {

    public function initialize() {
        AppBase.initialize();
        new Strings();

        if(Properties.getValue("FirstBoot")) {
            Properties.setValue("Sport", 1);
            Properties.setValue("SubSport", 0);
            Properties.setValue("Name", Strings.getString("Run_Generic"));
            Properties.setValue("CustomName", Strings.getString("Generic"));

            var deviceSettings = System.getDeviceSettings();
            Properties.setValue("SpeedUnits", deviceSettings.distanceUnits);
            Properties.setValue("PaceUnits", deviceSettings.paceUnits);
            Properties.setValue("DistanceUnits", deviceSettings.distanceUnits);
            Properties.setValue("NauticalSpeed", 2);
            Properties.setValue("TemperatureUnits", deviceSettings.temperatureUnits);
            
            Communications.openWebPage("https://github.com/calugj/anysport/blob/main/doc/manual.md", null ,null);
            
            Properties.setValue("FirstBoot", false);
        }
    }

    // onStart() is called on application start up
    public function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    public function onStop(state as Dictionary?) as Void {
        Sensor.setEnabledSensors([]);
        Position.enableLocationEvents({:acquisitionType => Position.LOCATION_DISABLE}, null);
    }

    // Return the initial view of your application here
    public function getInitialView() as [Views] or [Views, InputDelegates] {
        var loop = new WatchUi.ViewLoop(
            new MainLoopFactory(),
            {:wrap => true, :color => Properties.getValue("AccentColor") as Number}
        );
        return [ loop, new ViewLoopDelegate(loop) ];
    }

}

public function getApp() as AnySportPRO {
    return Application.getApp() as AnySportPRO;
}