import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.System;

public class UnitMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Unit);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        var speed_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("SpeedUnits") == System.UNIT_STATUTE) {
            speed_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }
        
        var pace_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("PaceUnits") == System.UNIT_STATUTE) {
            pace_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }
        
        var distance_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("DistanceUnits") == System.UNIT_STATUTE) {
            distance_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }

        var nautical_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("NauticalSpeed") == System.UNIT_STATUTE) {
            nautical_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        } else if(Properties.getValue("NauticalSpeed") == /*UNIT_NAUTICAL*/ 2) {
            nautical_substring = WatchUi.loadResource(Rez.Strings.Nautical);
        }

        var temperature_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("TemperatureUnits") == System.UNIT_STATUTE) {
            temperature_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }

        addItem(new CustomLabelSublabelMenuItem("SpeedUnits", WatchUi.loadResource(Rez.Strings.SpeedUnits), speed_substring));
        addItem(new CustomLabelSublabelMenuItem("PaceUnits", WatchUi.loadResource(Rez.Strings.PaceUnits), pace_substring));
        addItem(new CustomLabelSublabelMenuItem("DistanceUnits", WatchUi.loadResource(Rez.Strings.DistanceUnits), distance_substring));
        addItem(new CustomLabelSublabelMenuItem("NauticalSpeed", WatchUi.loadResource(Rez.Strings.NauticalSpeed), nautical_substring));
        addItem(new CustomLabelSublabelMenuItem("TemperatureUnits", WatchUi.loadResource(Rez.Strings.TemperatureUnits), temperature_substring));
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