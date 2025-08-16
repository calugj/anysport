import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Position;
import Toybox.Application;

public class GPSMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Positioning");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelSublabelMenuItem(0, Strings.getString("SatellitesOff"), null));

        if(Toybox.Position has :CONFIGURATION_GPS && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS, "GPS", Strings.getString("SingleBand")));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GLONASS && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GLONASS, "GLONASS", Strings.getString("SingleBand")));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GALILEO && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GALILEO)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GALILEO, "GALILEO", Strings.getString("SingleBand")));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_BEIDOU && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_BEIDOU)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_BEIDOU, "BEIDOU", Strings.getString("SingleBand")));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1 && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1, "All Systems", Strings.getString("SingleBand")));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5 && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5, "All Systems", Strings.getString("MultiBand")));
        }
        if(Toybox.Position has :CONFIGURATION_SAT_IQ && Position.hasConfigurationSupport(Position.CONFIGURATION_SAT_IQ)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_SAT_IQ, "SatIQ", null));
        }

        MenuUtils.setFocus(self, Properties.getValue("Satellites") as Number);
    }
}


public class GPSMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        var mode = item.getId() as Number;
        Properties.setValue("Satellites", mode);

        if(mode == 0) {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_DISABLE}, null);
        }
        else {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_CONTINUOUS, :configuration => mode as Position.Configuration}, null);
        }
        onBack();

        var menu = new MainMenu();
        menu = MenuUtils.setFocus(menu, :positioning);

        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}