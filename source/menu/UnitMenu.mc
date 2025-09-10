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

        addItem(new CustomLabelSublabelMenuItem("SpeedUnits", "", null));
        addItem(new CustomLabelSublabelMenuItem("PaceUnits", "", null));
        addItem(new CustomLabelSublabelMenuItem("DistanceUnits", "", null));
        addItem(new CustomLabelSublabelMenuItem("NauticalSpeed", "", null));
        addItem(new CustomLabelSublabelMenuItem("TemperatureUnits", "", null));
    }

    public function onShow() as Void {
        var speed_substring = Strings.getString("Metric");
        if(Properties.getValue("SpeedUnits") as Number == System.UNIT_STATUTE) {
            speed_substring = Strings.getString("Imperial");
        }
        
        var pace_substring = Strings.getString("Metric");
        if(Properties.getValue("PaceUnits") as Number == System.UNIT_STATUTE) {
            pace_substring = Strings.getString("Imperial");
        }
        
        var distance_substring = Strings.getString("Metric");
        if(Properties.getValue("DistanceUnits") as Number == System.UNIT_STATUTE) {
            distance_substring = Strings.getString("Imperial");
        }

        var nautical_substring = Strings.getString("Metric");
        if(Properties.getValue("NauticalSpeed") as Number == System.UNIT_STATUTE) {
            nautical_substring = Strings.getString("Imperial");
        } else if(Properties.getValue("NauticalSpeed") as Number == /*UNIT_NAUTICAL*/ 2) {
            nautical_substring = Strings.getString("Nautical");
        }

        var temperature_substring = Strings.getString("Metric");
        if(Properties.getValue("TemperatureUnits") as Number == System.UNIT_STATUTE) {
            temperature_substring = Strings.getString("Imperial");
        }

        updateItem(
            new CustomLabelSublabelMenuItem("SpeedUnits", Strings.getString("SpeedUnits"), speed_substring),
            findItemById("SpeedUnits")
        );
        updateItem(
            new CustomLabelSublabelMenuItem("PaceUnits", Strings.getString("PaceUnits"), pace_substring),
            findItemById("PaceUnits")
        );
        updateItem(
            new CustomLabelSublabelMenuItem("DistanceUnits", Strings.getString("DistanceUnits"), distance_substring),
            findItemById("DistanceUnits")
        );
        updateItem(
            new CustomLabelSublabelMenuItem("NauticalSpeed", Strings.getString("NauticalSpeed"), nautical_substring),
            findItemById("NauticalSpeed")
        );
        updateItem(
            new CustomLabelSublabelMenuItem("TemperatureUnits", Strings.getString("TemperatureUnits"), temperature_substring),
            findItemById("TemperatureUnits")
        );
    }
}


public class UnitMenuDelegate extends Menu2InputDelegate {
    
    private var menu as UnitMenu;
    
    public function initialize(_menu as UnitMenu) {
        Menu2InputDelegate.initialize();

        menu = _menu;
    }

    public function onSelect(item as MenuItem) as Void {
        var id = item.getId() as Number;
        
        var max = 1;
        if(id.equals("NauticalSpeed")) {
            max = 2;
        }

        var value = Properties.getValue(id as String) as Number + 1;
        if(value > max) {
            value = 0;
        }

        Properties.setValue(id as String, value);
        
        menu.onShow();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}