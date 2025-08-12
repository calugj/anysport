import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class FlyingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Flying);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("20.0," + WatchUi.loadResource(Rez.Strings.Flying_Generic), WatchUi.loadResource(Rez.Strings.Flying_Generic)));
        addItem(new CustomLabelMenuItem("26.0," + WatchUi.loadResource(Rez.Strings.Flying_HangGlide), WatchUi.loadResource(Rez.Strings.Flying_HangGlide)));
        addItem(new CustomLabelMenuItem("20.40," + WatchUi.loadResource(Rez.Strings.Flying_Wingsuit), WatchUi.loadResource(Rez.Strings.Flying_Wingsuit)));
        addItem(new CustomLabelMenuItem("34.0," + WatchUi.loadResource(Rez.Strings.Flying_Skydive), WatchUi.loadResource(Rez.Strings.Flying_Skydive)));
        addItem(new CustomLabelMenuItem("46.0," + WatchUi.loadResource(Rez.Strings.Flying_Jumpmaster), WatchUi.loadResource(Rez.Strings.Flying_Jumpmaster)));
        addItem(new CustomLabelMenuItem("20.39," + WatchUi.loadResource(Rez.Strings.Flying_Drone), WatchUi.loadResource(Rez.Strings.Flying_Drone)));
        addItem(new CustomLabelMenuItem("20.110," + WatchUi.loadResource(Rez.Strings.Flying_Canopy), WatchUi.loadResource(Rez.Strings.Flying_Canopy)));
        addItem(new CustomLabelMenuItem("20.111," + WatchUi.loadResource(Rez.Strings.Flying_Paraglide), WatchUi.loadResource(Rez.Strings.Flying_Paraglide)));
        addItem(new CustomLabelMenuItem("20.112," + WatchUi.loadResource(Rez.Strings.Flying_Paramotor), WatchUi.loadResource(Rez.Strings.Flying_Paramotor)));
        addItem(new CustomLabelMenuItem("20.113," + WatchUi.loadResource(Rez.Strings.Flying_Pressurized), WatchUi.loadResource(Rez.Strings.Flying_Pressurized)));
    }
}