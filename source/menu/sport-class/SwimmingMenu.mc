import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class SwimmingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Swimming);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("5.0," + WatchUi.loadResource(Rez.Strings.Swimming_Generic), WatchUi.loadResource(Rez.Strings.Swimming_Generic)));
        addItem(new CustomLabelMenuItem("5.17," + WatchUi.loadResource(Rez.Strings.Swimming_Lap), WatchUi.loadResource(Rez.Strings.Swimming_Lap)));
        addItem(new CustomLabelMenuItem("5.18," + WatchUi.loadResource(Rez.Strings.Swimming_Open), WatchUi.loadResource(Rez.Strings.Swimming_Open)));
    }
}