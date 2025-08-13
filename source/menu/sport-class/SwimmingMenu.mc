import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class SwimmingMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Swimming");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("5.0," + Strings.getString("Swimming_Generic"), Strings.getString("Swimming_Generic")));
        addItem(new CustomLabelMenuItem("5.17," + Strings.getString("Swimming_Lap"), Strings.getString("Swimming_Lap")));
        addItem(new CustomLabelMenuItem("5.18," + Strings.getString("Swimming_Open"), Strings.getString("Swimming_Open")));
    }
}