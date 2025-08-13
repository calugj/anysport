import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Application;
import Toybox.Communications;

public class CustomActivityMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Custom");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        RefreshRate.getInstance().setRefreshRate(RefreshRate.REFRESH_HIGH);

        var name = Properties.getValue("CustomName");
        var sport = Properties.getValue("CustomSport");
        var subSport = Properties.getValue("CustomSubsport");

        addItem(new CustomIconMenuItem(:apply, Strings.getString("Apply"), null, WatchUi.loadResource($.Rez.Drawables.Check)));
        addItem(new CustomIconMenuItem(:name, Strings.getString("Name"), name, WatchUi.loadResource($.Rez.Drawables.Custom)));
        addItem(new CustomIconMenuItem(:sport, Strings.getString("Sport"), sport, WatchUi.loadResource($.Rez.Drawables.Custom)));
        addItem(new CustomIconMenuItem(:subSport, Strings.getString("Subsport"), subSport, WatchUi.loadResource($.Rez.Drawables.Custom)));
        addItem(new CustomIconMenuItem(:reference, Strings.getString("Manual"), null, WatchUi.loadResource($.Rez.Drawables.Licenses)));
    }

    public function onShow() as Void {
        var name = Properties.getValue("CustomName");
        updateItem(
            new CustomIconMenuItem(:name, Strings.getString("Name"), name, WatchUi.loadResource($.Rez.Drawables.Custom)),
            findItemById(:name)
        );
    }
}


public class CustomActivityMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        var name = Properties.getValue("CustomName");
        var sport = Properties.getValue("CustomSport");
        var subSport = Properties.getValue("CustomSubsport");
        var view;

        switch(item.getId()) {
            case :apply:
                Properties.setValue("Name", name);
                Properties.setValue("Sport", sport);
                Properties.setValue("SubSport", subSport);
                
                WatchUi.popView(WatchUi.SLIDE_RIGHT);
                WatchUi.popView(WatchUi.SLIDE_RIGHT);
                var menu = new MainMenu();
                menu = MenuUtils.setFocus(menu, :class);
                WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
                WatchUi.requestUpdate();
                break;
            case :name:
                WatchUi.pushView(new WatchUi.TextPicker(name), new CustomNameTextPickerDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :sport:
                view = new CustomNumberPicker();
                WatchUi.pushView(view, new CustomSportNumberPickerDelegate(view, sport, 0, 255, 1), WatchUi.SLIDE_LEFT);
                break;
            case :subSport:
                view = new CustomNumberPicker();
                WatchUi.pushView(view, new CustomSubsportNumberPickerDelegate(view, subSport, 0, 255, 1), WatchUi.SLIDE_LEFT);
                break;
            case :reference:
                Communications.openWebPage("https://github.com/calugj/anysport/blob/main/doc/custom-sport.md", null ,null);
                break;
        }
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var menu = new ActivityClassMenu();
        menu = MenuUtils.setFocus(menu, :custom);
        WatchUi.switchToView(menu, new ActivityClassMenuDelegate(), WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}