import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class FitnessMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Fitness");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("4.0," + Strings.getString("Fitness_Generic"), Strings.getString("Fitness_Generic")));
        addItem(new CustomLabelMenuItem("4.14," + Strings.getString("Fitness_Rowing"), Strings.getString("Fitness_Rowing")));
        addItem(new CustomLabelMenuItem("4.15," + Strings.getString("Fitness_Elliptical"), Strings.getString("Fitness_Elliptical")));
        addItem(new CustomLabelMenuItem("4.16," + Strings.getString("Fitness_Stair"), Strings.getString("Fitness_Stair")));
        addItem(new CustomLabelMenuItem("4.25," + Strings.getString("Fitness_Ski"), Strings.getString("Fitness_Ski")));
        addItem(new CustomLabelMenuItem("84.0," + Strings.getString("Fitness_JumpRope"), Strings.getString("Fitness_JumpRope")));
        addItem(new CustomLabelMenuItem("59.1," + Strings.getString("Fitness_Onshore"), Strings.getString("Fitness_Onshore")));
    }
}