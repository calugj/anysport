import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class DivingMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Diving");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("53.0," + Strings.getString("Diving_Generic"), Strings.getString("Diving_Generic")));
        addItem(new CustomLabelMenuItem("53.53," + Strings.getString("Diving_Single"), Strings.getString("Diving_Single")));
        addItem(new CustomLabelMenuItem("53.54," + Strings.getString("Diving_Multi"), Strings.getString("Diving_Multi")));
        addItem(new CustomLabelMenuItem("53.55," + Strings.getString("Diving_Gauge"), Strings.getString("Diving_Gauge")));
        addItem(new CustomLabelMenuItem("53.56," + Strings.getString("Diving_Apnea"), Strings.getString("Diving_Apnea")));
        addItem(new CustomLabelMenuItem("53.57," + Strings.getString("Diving_Hunt"), Strings.getString("Diving_Hunt")));
    }
}