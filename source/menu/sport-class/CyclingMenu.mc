import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class CyclingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Cycling);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("2.0," + WatchUi.loadResource(Rez.Strings.Cycling_Generic), WatchUi.loadResource(Rez.Strings.Cycling_Generic)));
        addItem(new CustomLabelMenuItem("2.7," + WatchUi.loadResource(Rez.Strings.Cycling_Road), WatchUi.loadResource(Rez.Strings.Cycling_Road)));
        addItem(new CustomLabelMenuItem("2.8," + WatchUi.loadResource(Rez.Strings.Cycling_Mountain), WatchUi.loadResource(Rez.Strings.Cycling_Mountain)));
        addItem(new CustomLabelMenuItem("2.46," + WatchUi.loadResource(Rez.Strings.Cycling_Gravel), WatchUi.loadResource(Rez.Strings.Cycling_Gravel)));
        addItem(new CustomLabelMenuItem("2.6," + WatchUi.loadResource(Rez.Strings.Cycling_Indoor), WatchUi.loadResource(Rez.Strings.Cycling_Indoor)));
        addItem(new CustomLabelMenuItem("21.28," + WatchUi.loadResource(Rez.Strings.Cycling_eBiking), WatchUi.loadResource(Rez.Strings.Cycling_eBiking)));
        addItem(new CustomLabelMenuItem("2.47," + WatchUi.loadResource(Rez.Strings.Cycling_eMTB), WatchUi.loadResource(Rez.Strings.Cycling_eMTB)));
        addItem(new CustomLabelMenuItem("2.13," + WatchUi.loadResource(Rez.Strings.Cycling_Track), WatchUi.loadResource(Rez.Strings.Cycling_Track)));
        addItem(new CustomLabelMenuItem("2.12," + WatchUi.loadResource(Rez.Strings.Cycling_Hand), WatchUi.loadResource(Rez.Strings.Cycling_Hand)));
        addItem(new CustomLabelMenuItem("2.5," + WatchUi.loadResource(Rez.Strings.Cycling_Spin), WatchUi.loadResource(Rez.Strings.Cycling_Spin)));
        addItem(new CustomLabelMenuItem("2.9," + WatchUi.loadResource(Rez.Strings.Cycling_Downhill), WatchUi.loadResource(Rez.Strings.Cycling_Downhill)));
        addItem(new CustomLabelMenuItem("2.11," + WatchUi.loadResource(Rez.Strings.Cycling_Cyclocross), WatchUi.loadResource(Rez.Strings.Cycling_Cyclocross)));
        addItem(new CustomLabelMenuItem("2.29," + WatchUi.loadResource(Rez.Strings.Cycling_BMX), WatchUi.loadResource(Rez.Strings.Cycling_BMX)));
        addItem(new CustomLabelMenuItem("2.48," + WatchUi.loadResource(Rez.Strings.Cycling_Commuting), WatchUi.loadResource(Rez.Strings.Cycling_Commuting)));
        addItem(new CustomLabelMenuItem("2.49," + WatchUi.loadResource(Rez.Strings.Cycling_Mixed), WatchUi.loadResource(Rez.Strings.Cycling_Mixed)));
        addItem(new CustomLabelMenuItem("2.10," + WatchUi.loadResource(Rez.Strings.Cycling_Recumbent), WatchUi.loadResource(Rez.Strings.Cycling_Recumbent)));
        addItem(new CustomLabelMenuItem("2.58," + WatchUi.loadResource(Rez.Strings.Cycling_Virtual), WatchUi.loadResource(Rez.Strings.Cycling_Virtual)));
    }
}