import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class WalkingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Walking);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("11.0," + WatchUi.loadResource(Rez.Strings.Walking_Generic), WatchUi.loadResource(Rez.Strings.Walking_Generic)));
        addItem(new CustomLabelMenuItem("17.0," + WatchUi.loadResource(Rez.Strings.Walking_Hiking), WatchUi.loadResource(Rez.Strings.Walking_Hiking)));
        addItem(new CustomLabelMenuItem("16.0," + WatchUi.loadResource(Rez.Strings.Walking_Mountaineering), WatchUi.loadResource(Rez.Strings.Walking_Mountaineering)));
        addItem(new CustomLabelMenuItem("11.30," + WatchUi.loadResource(Rez.Strings.Walking_Casual), WatchUi.loadResource(Rez.Strings.Walking_Casual)));
        addItem(new CustomLabelMenuItem("11.31," + WatchUi.loadResource(Rez.Strings.Walking_Speed), WatchUi.loadResource(Rez.Strings.Walking_Speed)));
        addItem(new CustomLabelMenuItem("11.27," + WatchUi.loadResource(Rez.Strings.Walking_Indoor), WatchUi.loadResource(Rez.Strings.Walking_Indoor)));
    }
}