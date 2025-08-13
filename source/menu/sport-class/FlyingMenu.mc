import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class FlyingMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Flying");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("20.0," + Strings.getString("Flying_Generic"), Strings.getString("Flying_Generic")));
        addItem(new CustomLabelMenuItem("26.0," + Strings.getString("Flying_HangGlide"), Strings.getString("Flying_HangGlide")));
        addItem(new CustomLabelMenuItem("20.40," + Strings.getString("Flying_Wingsuit"), Strings.getString("Flying_Wingsuit")));
        addItem(new CustomLabelMenuItem("34.0," + Strings.getString("Flying_Skydive"), Strings.getString("Flying_Skydive")));
        addItem(new CustomLabelMenuItem("46.0," + Strings.getString("Flying_Jumpmaster"), Strings.getString("Flying_Jumpmaster")));
        addItem(new CustomLabelMenuItem("20.39," + Strings.getString("Flying_Drone"), Strings.getString("Flying_Drone")));
        addItem(new CustomLabelMenuItem("20.110," + Strings.getString("Flying_Canopy"), Strings.getString("Flying_Canopy")));
        addItem(new CustomLabelMenuItem("20.111," + Strings.getString("Flying_Paraglide"), Strings.getString("Flying_Paraglide")));
        addItem(new CustomLabelMenuItem("20.112," + Strings.getString("Flying_Paramotor"), Strings.getString("Flying_Paramotor")));
        addItem(new CustomLabelMenuItem("20.113," + Strings.getString("Flying_Pressurized"), Strings.getString("Flying_Pressurized")));
    }
}