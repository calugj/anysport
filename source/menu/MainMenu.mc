import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.Communications;

public class MainMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("AppName");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        var bitmap = WatchUi.loadResource($.Rez.Drawables.Datafields) as BitmapResource;

        addItem(new CustomIconMenuItem(:class, "", null, bitmap));
        addItem(new CustomIconMenuItem(:datafields, "", null, bitmap));
        addItem(new CustomIconMenuItem(:positioning, "", null, bitmap));
        addItem(new CustomIconMenuItem(:theme, "", null, bitmap));
        addItem(new CustomIconMenuItem(:lap, "", null, bitmap));
        addItem(new CustomIconMenuItem(:unit, "", null, bitmap));
        addItem(new CustomIconMenuItem(:extra, "", null, bitmap));
        addItem(new CustomIconMenuItem(:donations, "", null, bitmap));
        addItem(new CustomIconMenuItem(:reference, "", null, bitmap));
    }

    public function onShow() {
        (RefreshRate.getInstance() as RefreshRate).setRefreshRate(RefreshRate.REFRESH_LOW);

        var pages = Properties.getValue("Pages") as Number;
        var datafields_substring = pages.toString();
        if(pages == 1) {
            datafields_substring = datafields_substring + " " + Strings.getString("Page");
        } else {
            datafields_substring = datafields_substring + " " + Strings.getString("Pages");
        }
            
        var positioning_substring = "";
        switch(Properties.getValue("Satellites") as Number) {
            case 0:
                positioning_substring = Strings.getString("SatellitesOff");
                break;
            case 1:
                positioning_substring = "GPS";
                break;
            case 2:
                positioning_substring = "GLONASS";
                break;
            case 3:
                positioning_substring = "GALILEO";
                break;
            case 4:
                positioning_substring = "BEIDOU";
                break;
            case 5:
                positioning_substring = "All Systems";
                break;
            case 6:
                positioning_substring = "All Systems L1 + L5";
                break;
            case 255:
                positioning_substring = "SatIQ";
                break;
        }

        var lap_substring = "";
        if(Properties.getValue("LapActivated")) {
            lap_substring = Strings.getString("Active");
        } else {
            lap_substring = Strings.getString("Inactive");
        }

        var theme_substring;
        if(Properties.getValue("BackgroundColor") as Number == Graphics.COLOR_WHITE) {
            theme_substring = Strings.getString("Light");
        } else {
            theme_substring = Strings.getString("Dark");
        }
        theme_substring += ", HEX " + (Properties.getValue("AccentColor") as Number).format("%06X");

        updateItem(
            new CustomIconMenuItem(:class, Strings.getString("ActivityType"), Properties.getValue("Name") as String, WatchUi.loadResource($.Rez.Drawables.Running) as BitmapResource),
            findItemById(:class)
        );
        updateItem(
            new CustomIconMenuItem(:datafields, Strings.getString("Datafields"), datafields_substring, WatchUi.loadResource($.Rez.Drawables.Datafields) as BitmapResource),
            findItemById(:datafields)
        );
        updateItem(
            new CustomIconMenuItem(:positioning, Strings.getString("Positioning"), positioning_substring, WatchUi.loadResource($.Rez.Drawables.GPS) as BitmapResource),
            findItemById(:positioning)
        );
        updateItem(
            new CustomIconMenuItem(:theme, Strings.getString("Theme"), theme_substring, WatchUi.loadResource($.Rez.Drawables.Color) as BitmapResource),
            findItemById(:theme)
        );
        updateItem(
            new CustomIconMenuItem(:lap, Strings.getString("Lap"), lap_substring, WatchUi.loadResource($.Rez.Drawables.Lap) as BitmapResource),
            findItemById(:lap)
        );
        updateItem(
            new CustomIconMenuItem(:unit, Strings.getString("Unit"), null, WatchUi.loadResource($.Rez.Drawables.Unit) as BitmapResource),
            findItemById(:unit)
        );
        updateItem(
            new CustomIconMenuItem(:extra, Strings.getString("Extra"), null, WatchUi.loadResource($.Rez.Drawables.Other) as BitmapResource),
            findItemById(:extra)
        );
        updateItem(
            new CustomIconMenuItem(:donations, Strings.getString("Donate"), Strings.getString("DonateSub"), WatchUi.loadResource($.Rez.Drawables.Donations) as BitmapResource),
            findItemById(:donations)
        );
        updateItem(
            new CustomIconMenuItem(:reference, Strings.getString("Manual"), null, WatchUi.loadResource($.Rez.Drawables.Licenses) as BitmapResource),
            findItemById(:reference)
        );

    }

    public function drawFooter(dc as Dc) as Void {
        dc.setAntiAlias(true);

        var height = System.getDeviceSettings().screenHeight*0.38;
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        var bitmap = WatchUi.loadResource(Rez.Drawables.Down) as BitmapResource;
        dc.drawBitmap(dc.getWidth()*0.4 - bitmap.getWidth()/2, height*0.5 - bitmap.getHeight()/2, bitmap);
        bitmap = WatchUi.loadResource(Rez.Drawables.ExtraSettings) as BitmapResource;
        dc.drawBitmap(dc.getWidth()*0.6 - bitmap.getWidth()/2, height*0.5 - bitmap.getHeight()/2, bitmap);
    }
}


public class MainMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {

        var view;

        switch(item.getId() as Object) {
            case :class:
                if((SportData.getInstance() as SportData).isRecordingStarted() ) {
                    break;
                }
                WatchUi.pushView(new ActivityClassMenu(), new ActivityClassMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :datafields:
                view = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
                WatchUi.pushView(view, new ViewLoopDelegate(view), WatchUi.SLIDE_LEFT);
                break;
            case :positioning:
                WatchUi.pushView(new GPSMenu(), new GPSMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :theme:
                WatchUi.pushView(new ThemeMenu(), new ThemeMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :lap:
                WatchUi.pushView(new LapMenu(), new LapMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :unit:
                view = new UnitMenu();
                WatchUi.pushView(view, new UnitMenuDelegate(view), WatchUi.SLIDE_LEFT);
                break;
            case :extra:
                view = new ExtraMenu();
                WatchUi.pushView(view, new ExtraMenuDelegate(view), WatchUi.SLIDE_LEFT);
                break;
            case :donations:
                WatchUi.pushView(new DonationsMenu(), new DonationsMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :reference:
                Communications.openWebPage("https://github.com/calugj/anysport/blob/main/doc/manual.md", null ,null);
                break;
        }
        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_BLINK);
        var loop = new WatchUi.ViewLoop(new MainLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_BLINK);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        if(key == WatchUi.KEY_DOWN) {
            WatchUi.switchToView(new MainMenuExtra(), new MainMenuExtraDelegate(), WatchUi.SLIDE_UP);
        }
        return false;
    }

    public function onFooter() as Void {
        onWrap(WatchUi.KEY_DOWN);
    }
}