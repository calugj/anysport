import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class MotorsportMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Motorsports);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("24.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Driving), WatchUi.loadResource(Rez.Strings.Motorsport_Driving)));
        addItem(new CustomLabelMenuItem("22.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Motorcycling), WatchUi.loadResource(Rez.Strings.Motorsport_Motorcycling)));
        addItem(new CustomLabelMenuItem("22.36," + WatchUi.loadResource(Rez.Strings.Motorsport_Motocross), WatchUi.loadResource(Rez.Strings.Motorsport_Motocross)));
        addItem(new CustomLabelMenuItem("23.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Boating), WatchUi.loadResource(Rez.Strings.Motorsport_Boating)));
        addItem(new CustomLabelMenuItem("36.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Snowmobiling), WatchUi.loadResource(Rez.Strings.Motorsport_Snowmobiling)));
        addItem(new CustomLabelMenuItem("22.35," + WatchUi.loadResource(Rez.Strings.Motorsport_ATV), WatchUi.loadResource(Rez.Strings.Motorsport_ATV)));
        addItem(new CustomLabelMenuItem("57.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Race), WatchUi.loadResource(Rez.Strings.Motorsport_Race)));
    }
}