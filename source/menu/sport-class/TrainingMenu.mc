import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class TrainingMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Training");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("10.0," + Strings.getString("Training_Generic"), Strings.getString("Training_Generic")));
        addItem(new CustomLabelMenuItem("10.19," + Strings.getString("Training_Flexibility"), Strings.getString("Training_Flexibility")));
        addItem(new CustomLabelMenuItem("10.20," + Strings.getString("Training_Strength"), Strings.getString("Training_Strength")));
        addItem(new CustomLabelMenuItem("10.26," + Strings.getString("Training_Cardio"), Strings.getString("Training_Cardio")));
        addItem(new CustomLabelMenuItem("10.43," + Strings.getString("Training_Yoga"), Strings.getString("Training_Yoga")));
        addItem(new CustomLabelMenuItem("4.44," + Strings.getString("Training_Pilates"), Strings.getString("Training_Pilates")));
        addItem(new CustomLabelMenuItem("62.70," + Strings.getString("Training_HIIT"), Strings.getString("Training_HIIT")));
        addItem(new CustomLabelMenuItem("62.73," + Strings.getString("Training_AMRAP"), Strings.getString("Training_AMRAP")));
        addItem(new CustomLabelMenuItem("62.74," + Strings.getString("Training_EMOM"), Strings.getString("Training_EMOM")));
        addItem(new CustomLabelMenuItem("62.75," + Strings.getString("Training_TABATA"), Strings.getString("Training_TABATA")));
    }
}