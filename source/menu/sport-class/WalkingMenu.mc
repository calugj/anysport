import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class WalkingMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Walking");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("11.0," + Strings.getString("Walking_Generic"), Strings.getString("Walking_Generic")));
        addItem(new CustomLabelMenuItem("17.0," + Strings.getString("Walking_Hiking"), Strings.getString("Walking_Hiking")));
        addItem(new CustomLabelMenuItem("16.0," + Strings.getString("Walking_Mountaineering"), Strings.getString("Walking_Mountaineering")));
        addItem(new CustomLabelMenuItem("11.30," + Strings.getString("Walking_Casual"), Strings.getString("Walking_Casual")));
        addItem(new CustomLabelMenuItem("11.31," + Strings.getString("Walking_Speed"), Strings.getString("Walking_Speed")));
        addItem(new CustomLabelMenuItem("11.27," + Strings.getString("Walking_Indoor"), Strings.getString("Walking_Indoor")));
    }
}