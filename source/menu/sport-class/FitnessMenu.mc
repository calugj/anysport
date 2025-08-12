import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class FitnessMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Fitness);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("4.0," + WatchUi.loadResource(Rez.Strings.Fitness_Generic), WatchUi.loadResource(Rez.Strings.Fitness_Generic)));
        addItem(new CustomLabelMenuItem("4.14," + WatchUi.loadResource(Rez.Strings.Fitness_Rowing), WatchUi.loadResource(Rez.Strings.Fitness_Rowing)));
        addItem(new CustomLabelMenuItem("4.15," + WatchUi.loadResource(Rez.Strings.Fitness_Elliptical), WatchUi.loadResource(Rez.Strings.Fitness_Elliptical)));
        addItem(new CustomLabelMenuItem("4.16," + WatchUi.loadResource(Rez.Strings.Fitness_Stair), WatchUi.loadResource(Rez.Strings.Fitness_Stair)));
        addItem(new CustomLabelMenuItem("4.25," + WatchUi.loadResource(Rez.Strings.Fitness_Ski), WatchUi.loadResource(Rez.Strings.Fitness_Ski)));
        addItem(new CustomLabelMenuItem("84.0," + WatchUi.loadResource(Rez.Strings.Fitness_JumpRope), WatchUi.loadResource(Rez.Strings.Fitness_JumpRope)));
        addItem(new CustomLabelMenuItem("59.1," + WatchUi.loadResource(Rez.Strings.Fitness_Onshore), WatchUi.loadResource(Rez.Strings.Fitness_Onshore)));
    }
}