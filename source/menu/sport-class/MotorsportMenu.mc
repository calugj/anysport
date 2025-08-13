import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class MotorsportMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Motorsports");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("24.0," + Strings.getString("Motorsport_Driving"), Strings.getString("Motorsport_Driving")));
        addItem(new CustomLabelMenuItem("22.0," + Strings.getString("Motorsport_Motorcycling"), Strings.getString("Motorsport_Motorcycling")));
        addItem(new CustomLabelMenuItem("22.36," + Strings.getString("Motorsport_Motocross"), Strings.getString("Motorsport_Motocross")));
        addItem(new CustomLabelMenuItem("23.0," + Strings.getString("Motorsport_Boating"), Strings.getString("Motorsport_Boating")));
        addItem(new CustomLabelMenuItem("36.0," + Strings.getString("Motorsport_Snowmobiling"), Strings.getString("Motorsport_Snowmobiling")));
        addItem(new CustomLabelMenuItem("22.35," + Strings.getString("Motorsport_ATV"), Strings.getString("Motorsport_ATV")));
        addItem(new CustomLabelMenuItem("57.0," + Strings.getString("Motorsport_Race"), Strings.getString("Motorsport_Race")));
    }
}