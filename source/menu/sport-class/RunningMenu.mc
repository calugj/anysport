import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class RunningMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Running);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("1.0," + WatchUi.loadResource(Rez.Strings.Run_Generic), WatchUi.loadResource(Rez.Strings.Run_Generic)));
        addItem(new CustomLabelMenuItem("1.1," + WatchUi.loadResource(Rez.Strings.Run_Treadmill), WatchUi.loadResource(Rez.Strings.Run_Treadmill)));
        addItem(new CustomLabelMenuItem("1.2," + WatchUi.loadResource(Rez.Strings.Run_Street), WatchUi.loadResource(Rez.Strings.Run_Street)));
        addItem(new CustomLabelMenuItem("1.3," + WatchUi.loadResource(Rez.Strings.Run_Trail), WatchUi.loadResource(Rez.Strings.Run_Trail)));
        addItem(new CustomLabelMenuItem("1.4," + WatchUi.loadResource(Rez.Strings.Run_Track), WatchUi.loadResource(Rez.Strings.Run_Track)));
        addItem(new CustomLabelMenuItem("1.67," + WatchUi.loadResource(Rez.Strings.Run_Ultra), WatchUi.loadResource(Rez.Strings.Run_Ultra)));
        addItem(new CustomLabelMenuItem("1.45," + WatchUi.loadResource(Rez.Strings.Run_Indoor), WatchUi.loadResource(Rez.Strings.Run_Indoor)));
        addItem(new CustomLabelMenuItem("1.59," + WatchUi.loadResource(Rez.Strings.Run_Obstacle), WatchUi.loadResource(Rez.Strings.Run_Obstacle)));
        addItem(new CustomLabelMenuItem("1.58," + WatchUi.loadResource(Rez.Strings.Run_Virtual), WatchUi.loadResource(Rez.Strings.Run_Virtual)));
    }
}