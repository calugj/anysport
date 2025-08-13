import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class WaterMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("WaterSports");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("32.0," + Strings.getString("Water_Sail"), Strings.getString("Water_Sail")));
        addItem(new CustomLabelMenuItem("41.0," + Strings.getString("Water_Kayak"), Strings.getString("Water_Kayak")));
        addItem(new CustomLabelMenuItem("19.0," + Strings.getString("Water_Paddle"), Strings.getString("Water_Paddle")));
        addItem(new CustomLabelMenuItem("37.0," + Strings.getString("Water_SUP"), Strings.getString("Water_SUP")));
        addItem(new CustomLabelMenuItem("42.0," + Strings.getString("Water_Raft"), Strings.getString("Water_Raft")));
        addItem(new CustomLabelMenuItem("42.41," + Strings.getString("Water_Whitewater"), Strings.getString("Water_Whitewater")));
        addItem(new CustomLabelMenuItem("15.0," + Strings.getString("Water_Row"), Strings.getString("Water_Row")));
        addItem(new CustomLabelMenuItem("43.0," + Strings.getString("Water_Windsurf"), Strings.getString("Water_Windsurf")));
        addItem(new CustomLabelMenuItem("44.0," + Strings.getString("Water_Kitesurf"), Strings.getString("Water_Kitesurf")));
        addItem(new CustomLabelMenuItem("39.0," + Strings.getString("Water_Wakeboard"), Strings.getString("Water_Wakeboard")));
        addItem(new CustomLabelMenuItem("77.0," + Strings.getString("Water_Wakesurf"), Strings.getString("Water_Wakesurf")));
        addItem(new CustomLabelMenuItem("40.0," + Strings.getString("Water_Ski"), Strings.getString("Water_Ski")));
        addItem(new CustomLabelMenuItem("38.0," + Strings.getString("Water_Surf"), Strings.getString("Water_Surf")));
        addItem(new CustomLabelMenuItem("82.0," + Strings.getString("Water_Snorkel"), Strings.getString("Water_Snorkel")));
        addItem(new CustomLabelMenuItem("76.0," + Strings.getString("Water_Tube"), Strings.getString("Water_Tube"))); 
    }
}