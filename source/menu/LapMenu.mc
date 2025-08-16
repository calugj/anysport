import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

public class LapMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Lap");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        var lapActivated = Properties.getValue("LapActivated") as Boolean;
        var autoLapActivated = Properties.getValue("AutoLapActivated") as Boolean;
        var lapScreen = Properties.getValue("LapScreen") as Boolean;
        addItem(new CustomSwitchMenuItem(:lapActive, Strings.getString("LapActive"), null, lapActivated));
        if(lapActivated) {
            addItem(new CustomSwitchMenuItem(:lapScreen, Strings.getString("LapScreen"), null, lapScreen));
            if(lapScreen) {
                var lapField = Properties.getValue("LapScreenField") as Number;
                var subString = ((SportData.getInstance() as SportData).getMetric(lapField) as Array<String>)[1];
                addItem(new CustomLabelSublabelMenuItem(:lapField, Strings.getString("LapField"), subString));
            }
            
            addItem(new CustomSwitchMenuItem(:autoLapActive, Strings.getString("AutoLap"), null, autoLapActivated));
            if(autoLapActivated) {
                var autoLapValue = (Properties.getValue("AutoLapValue") as Numeric).format("%.1f").toString();
                var unit = Properties.getValue("DistanceUnits") as Number;
                if((SportData.getInstance() as SportData).isNauticalActivity()) {
                    unit = Properties.getValue("NauticalUnits") as Number;
                }

                if(unit == System.UNIT_METRIC) {
                    autoLapValue += " km";
                } else if (unit == System.UNIT_STATUTE) {
                    autoLapValue += " mi";
                } else {
                    autoLapValue += " NM";
                }
                
                addItem(new CustomLabelSublabelMenuItem(:autoLapValue, Strings.getString("AutoLapDistance"), autoLapValue));
            }
        }
    }
}


public class LapMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        
        var flag;
        var menu;
    
        switch(id as Object) {
            case :lapActive:
                flag = Properties.getValue("LapActivated") as Boolean;
                Properties.setValue("LapActivated", !flag);

                menu = new LapMenu();
                menu = MenuUtils.setFocus(menu, :lapActive);

                WatchUi.switchToView(menu, self, WatchUi.SLIDE_IMMEDIATE);
                break;
            case :lapScreen:
                flag = Properties.getValue("LapScreen") as Boolean;
                Properties.setValue("LapScreen", !flag);

                menu = new LapMenu();
                menu = MenuUtils.setFocus(menu, :lapScreen);

                WatchUi.switchToView(menu, self, WatchUi.SLIDE_IMMEDIATE);
                break;
            case :lapField:
                menu = new FieldSettingMenu();
                menu = MenuUtils.setFocus(menu as FieldSettingMenu, Properties.getValue("LapScreenField") as Number);
                WatchUi.pushView(menu, new LapFieldSettingMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :autoLapActive:
                flag = Properties.getValue("AutoLapActivated") as Boolean;
                Properties.setValue("AutoLapActivated", !flag);

                menu = new LapMenu();
                menu = MenuUtils.setFocus(menu, :autoLapActive);
                WatchUi.switchToView(menu, self, WatchUi.SLIDE_IMMEDIATE);
                break;
            case :autoLapValue:
                var view = new CustomNumberPicker();
                var initial = Properties.getValue("AutoLapValue") as Float;
                WatchUi.pushView(view, new AutoLapNumberPickerDelegate(view, initial, 0.0, 100.0, 0.1), WatchUi.SLIDE_LEFT);
                break;
        }

        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var menu = new MainMenu();
        menu = MenuUtils.setFocus(menu, :lap);

        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}