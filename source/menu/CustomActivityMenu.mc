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

        (RefreshRate.getInstance() as RefreshRate).setRefreshRate(RefreshRate.REFRESH_HIGH);

        var bitmap = WatchUi.loadResource($.Rez.Drawables.Datafields) as BitmapResource;

        addItem(new CustomIconMenuItem(:apply, "", null, bitmap));
        addItem(new CustomIconMenuItem(:name, "", null, bitmap));
        addItem(new CustomIconMenuItem(:sport, "", null, bitmap));
        addItem(new CustomIconMenuItem(:subSport, "", null, bitmap));
        addItem(new CustomIconMenuItem(:reference, "", null, bitmap));
    }

    public function onShow() as Void {
        var name = Properties.getValue("CustomName") as String;
        var sport = Properties.getValue("CustomSport") as String;
        var subSport = Properties.getValue("CustomSubsport") as String;
        
        updateItem(
            new CustomIconMenuItem(:apply, Strings.getString("Apply"), null, WatchUi.loadResource($.Rez.Drawables.Check) as BitmapResource),
            findItemById(:apply)
        );
        updateItem(
            new CustomIconMenuItem(:name, Strings.getString("Name"), name, WatchUi.loadResource($.Rez.Drawables.Custom) as BitmapResource),
            findItemById(:name)
        );
        updateItem(
            new CustomIconMenuItem(:sport, Strings.getString("Sport"), sport, WatchUi.loadResource($.Rez.Drawables.Custom) as BitmapResource),
            findItemById(:sport)
        );
        updateItem(
            new CustomIconMenuItem(:subSport, Strings.getString("Subsport"), subSport, WatchUi.loadResource($.Rez.Drawables.Custom) as BitmapResource),
            findItemById(:subSport)
        );
        updateItem(
            new CustomIconMenuItem(:reference, Strings.getString("Manual"), null, WatchUi.loadResource($.Rez.Drawables.Licenses) as BitmapResource),
            findItemById(:reference)
        );
    }
}


public class CustomActivityMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        var name = Properties.getValue("CustomName") as String;
        var sport = Properties.getValue("CustomSport") as Number;
        var subSport = Properties.getValue("CustomSubsport") as Number;
        var view;

        switch(item.getId() as Object) {
            case :apply:
                Properties.setValue("Name", name);
                Properties.setValue("Sport", sport);
                Properties.setValue("SubSport", subSport);
                
                WatchUi.popView(WatchUi.SLIDE_RIGHT);
                WatchUi.popView(WatchUi.SLIDE_RIGHT);
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
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}