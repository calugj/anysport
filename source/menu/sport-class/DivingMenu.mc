import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class DivingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Diving);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("53.0," + WatchUi.loadResource(Rez.Strings.Diving_Generic), WatchUi.loadResource(Rez.Strings.Diving_Generic)));
        addItem(new CustomLabelMenuItem("53.53," + WatchUi.loadResource(Rez.Strings.Diving_Single), WatchUi.loadResource(Rez.Strings.Diving_Single)));
        addItem(new CustomLabelMenuItem("53.54," + WatchUi.loadResource(Rez.Strings.Diving_Multi), WatchUi.loadResource(Rez.Strings.Diving_Multi)));
        addItem(new CustomLabelMenuItem("53.55," + WatchUi.loadResource(Rez.Strings.Diving_Gauge), WatchUi.loadResource(Rez.Strings.Diving_Gauge)));
        addItem(new CustomLabelMenuItem("53.56," + WatchUi.loadResource(Rez.Strings.Diving_Apnea), WatchUi.loadResource(Rez.Strings.Diving_Apnea)));
        addItem(new CustomLabelMenuItem("53.57," + WatchUi.loadResource(Rez.Strings.Diving_Hunt), WatchUi.loadResource(Rez.Strings.Diving_Hunt)));
    }
}