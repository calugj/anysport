import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.System;

public class UnitMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Unit");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        var speed_substring = Strings.getString("Metric");
        if(Properties.getValue("SpeedUnits") == System.UNIT_STATUTE) {
            speed_substring = Strings.getString("Imperial");
        }
        
        var pace_substring = Strings.getString("Metric");
        if(Properties.getValue("PaceUnits") == System.UNIT_STATUTE) {
            pace_substring = Strings.getString("Imperial");
        }
        
        var distance_substring = Strings.getString("Metric");
        if(Properties.getValue("DistanceUnits") == System.UNIT_STATUTE) {
            distance_substring = Strings.getString("Imperial");
        }

        var nautical_substring = Strings.getString("Metric");
        if(Properties.getValue("NauticalSpeed") == System.UNIT_STATUTE) {
            nautical_substring = Strings.getString("Imperial");
        } else if(Properties.getValue("NauticalSpeed") == /*UNIT_NAUTICAL*/ 2) {
            nautical_substring = Strings.getString("Nautical");
        }

        var temperature_substring = Strings.getString("Metric");
        if(Properties.getValue("TemperatureUnits") == System.UNIT_STATUTE) {
            temperature_substring = Strings.getString("Imperial");
        }

        addItem(new CustomLabelSublabelMenuItem("SpeedUnits", Strings.getString("SpeedUnits"), speed_substring));
        addItem(new CustomLabelSublabelMenuItem("PaceUnits", Strings.getString("PaceUnits"), pace_substring));
        addItem(new CustomLabelSublabelMenuItem("DistanceUnits", Strings.getString("DistanceUnits"), distance_substring));
        addItem(new CustomLabelSublabelMenuItem("NauticalSpeed", Strings.getString("NauticalSpeed"), nautical_substring));
        addItem(new CustomLabelSublabelMenuItem("TemperatureUnits", Strings.getString("TemperatureUnits"), temperature_substring));
    }
}


public class UnitMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        
        var max = 1;
        if(id.equals("NauticalSpeed")) {
            max = 2;
        }

        var value = Properties.getValue(id as String) + 1;
        if(value > max) {
            value = 0;
        }

        Properties.setValue(id as String, value);

        var menu = new UnitMenu();
        menu = MenuUtils.setFocus(menu, id);
        WatchUi.switchToView(menu, self, WatchUi.SLIDE_IMMEDIATE);

        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}