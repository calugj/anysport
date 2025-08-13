import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class ClimbingMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Climbing");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("31.0," + Strings.getString("Climbing_Generic"), Strings.getString("Climbing_Generic")));
        addItem(new CustomLabelMenuItem("48.0," + Strings.getString("Climbing_Floor"), Strings.getString("Climbing_Floor")));
        addItem(new CustomLabelMenuItem("31.68," + Strings.getString("Climbing_Indoor"), Strings.getString("Climbing_Indoor")));
        addItem(new CustomLabelMenuItem("31.69," + Strings.getString("Climbing_Bouldering"), Strings.getString("Climbing_Bouldering")));
    }
}