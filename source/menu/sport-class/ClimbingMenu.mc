import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class ClimbingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Climbing);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("31.0," + WatchUi.loadResource(Rez.Strings.Climbing_Generic), WatchUi.loadResource(Rez.Strings.Climbing_Generic)));
        addItem(new CustomLabelMenuItem("48.0," + WatchUi.loadResource(Rez.Strings.Climbing_Floor), WatchUi.loadResource(Rez.Strings.Climbing_Floor)));
        addItem(new CustomLabelMenuItem("31.68," + WatchUi.loadResource(Rez.Strings.Climbing_Indoor), WatchUi.loadResource(Rez.Strings.Climbing_Indoor)));
        addItem(new CustomLabelMenuItem("31.69," + WatchUi.loadResource(Rez.Strings.Climbing_Bouldering), WatchUi.loadResource(Rez.Strings.Climbing_Bouldering)));
    }
}