import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class TrainingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Training);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("10.0," + WatchUi.loadResource(Rez.Strings.Training_Generic), WatchUi.loadResource(Rez.Strings.Training_Generic)));
        addItem(new CustomLabelMenuItem("10.19," + WatchUi.loadResource(Rez.Strings.Training_Flexibility), WatchUi.loadResource(Rez.Strings.Training_Flexibility)));
        addItem(new CustomLabelMenuItem("10.20," + WatchUi.loadResource(Rez.Strings.Training_Strength), WatchUi.loadResource(Rez.Strings.Training_Strength)));
        addItem(new CustomLabelMenuItem("10.26," + WatchUi.loadResource(Rez.Strings.Training_Cardio), WatchUi.loadResource(Rez.Strings.Training_Cardio)));
        addItem(new CustomLabelMenuItem("10.43," + WatchUi.loadResource(Rez.Strings.Training_Yoga), WatchUi.loadResource(Rez.Strings.Training_Yoga)));
        addItem(new CustomLabelMenuItem("4.44," + WatchUi.loadResource(Rez.Strings.Training_Pilates), WatchUi.loadResource(Rez.Strings.Training_Pilates)));
        addItem(new CustomLabelMenuItem("62.70," + WatchUi.loadResource(Rez.Strings.Training_HIIT), WatchUi.loadResource(Rez.Strings.Training_HIIT)));
        addItem(new CustomLabelMenuItem("62.73," + WatchUi.loadResource(Rez.Strings.Training_AMRAP), WatchUi.loadResource(Rez.Strings.Training_AMRAP)));
        addItem(new CustomLabelMenuItem("62.74," + WatchUi.loadResource(Rez.Strings.Training_EMOM), WatchUi.loadResource(Rez.Strings.Training_EMOM)));
        addItem(new CustomLabelMenuItem("62.75," + WatchUi.loadResource(Rez.Strings.Training_TABATA), WatchUi.loadResource(Rez.Strings.Training_TABATA)));
    }
}