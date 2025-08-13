import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class RunningMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Running");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("1.0," + Strings.getString("Run_Generic"), Strings.getString("Run_Generic")));
        addItem(new CustomLabelMenuItem("1.1," + Strings.getString("Run_Treadmill"), Strings.getString("Run_Treadmill")));
        addItem(new CustomLabelMenuItem("1.2," + Strings.getString("Run_Street"), Strings.getString("Run_Street")));
        addItem(new CustomLabelMenuItem("1.3," + Strings.getString("Run_Trail"), Strings.getString("Run_Trail")));
        addItem(new CustomLabelMenuItem("1.4," + Strings.getString("Run_Track"), Strings.getString("Run_Track")));
        addItem(new CustomLabelMenuItem("1.67," + Strings.getString("Run_Ultra"), Strings.getString("Run_Ultra")));
        addItem(new CustomLabelMenuItem("1.45," + Strings.getString("Run_Indoor"), Strings.getString("Run_Indoor")));
        addItem(new CustomLabelMenuItem("1.59," + Strings.getString("Run_Obstacle"), Strings.getString("Run_Obstacle")));
        addItem(new CustomLabelMenuItem("1.58," + Strings.getString("Run_Virtual"), Strings.getString("Run_Virtual")));
    }
}