import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.Communications;

public class MainMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.AppName);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        var pages = Properties.getValue("Pages");
        var datafields_substring = pages.toString();
        if(pages == 1) {
            datafields_substring = datafields_substring + " " + WatchUi.loadResource(Rez.Strings.Page);
        } else {
            datafields_substring = datafields_substring + " " + WatchUi.loadResource(Rez.Strings.Pages);
        }
            
        var positioning_substring = "";
        switch(Properties.getValue("Satellites")) {
            case 0:
                positioning_substring = WatchUi.loadResource(Rez.Strings.SatellitesOff);
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
            lap_substring = WatchUi.loadResource(Rez.Strings.Active);
        } else {
            lap_substring = WatchUi.loadResource(Rez.Strings.Inactive);
        }

        var theme_substring;
        if(Properties.getValue("BackgroundColor") == Graphics.COLOR_WHITE) {
            theme_substring = WatchUi.loadResource($.Rez.Strings.Light);
        } else {
            theme_substring = WatchUi.loadResource($.Rez.Strings.Dark);
        }
        theme_substring += ", HEX " + Properties.getValue("AccentColor").format("%06X");

        addItem(new CustomIconMenuItem(:class, WatchUi.loadResource(Rez.Strings.ActivityType), Properties.getValue("Name"), WatchUi.loadResource($.Rez.Drawables.Running)));
        addItem(new CustomIconMenuItem(:datafields, WatchUi.loadResource(Rez.Strings.Datafields), datafields_substring, WatchUi.loadResource($.Rez.Drawables.Datafields)));
        addItem(new CustomIconMenuItem(:positioning, WatchUi.loadResource(Rez.Strings.Positioning), positioning_substring, WatchUi.loadResource($.Rez.Drawables.GPS)));
        addItem(new CustomIconMenuItem(:theme, WatchUi.loadResource(Rez.Strings.Theme), theme_substring, WatchUi.loadResource($.Rez.Drawables.Color)));
        addItem(new CustomIconMenuItem(:lap, WatchUi.loadResource(Rez.Strings.Lap), lap_substring, WatchUi.loadResource($.Rez.Drawables.Lap)));
        addItem(new CustomIconMenuItem(:unit, WatchUi.loadResource(Rez.Strings.Unit), null, WatchUi.loadResource($.Rez.Drawables.Unit)));
        addItem(new CustomIconMenuItem(:extra, WatchUi.loadResource(Rez.Strings.Extra), null, WatchUi.loadResource($.Rez.Drawables.Other)));
        addItem(new CustomIconMenuItem(:donations, WatchUi.loadResource(Rez.Strings.Donate), WatchUi.loadResource(Rez.Strings.DonateSub), WatchUi.loadResource($.Rez.Drawables.Donations)));
        addItem(new CustomIconMenuItem(:reference, WatchUi.loadResource(Rez.Strings.Manual), null, WatchUi.loadResource($.Rez.Drawables.Licenses)));
    }

    public function onShow() {
        RefreshRate.getInstance().setRefreshRate(RefreshRate.REFRESH_LOW);
    }

    public function drawFooter(dc as Dc) as Void {
        dc.setAntiAlias(true);

        var height = System.getDeviceSettings().screenHeight*0.38;
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        var bitmap = WatchUi.loadResource(Rez.Drawables.Down);
        dc.drawBitmap(dc.getWidth()*0.4 - bitmap.getWidth()/2, height*0.5 - bitmap.getHeight()/2, bitmap);
        bitmap = WatchUi.loadResource(Rez.Drawables.ExtraSettings);
        dc.drawBitmap(dc.getWidth()*0.6 - bitmap.getWidth()/2, height*0.5 - bitmap.getHeight()/2, bitmap);
    }
}


public class MainMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {

        switch(item.getId()) {
            case :class:
                if( SportData.getInstance().isRecordingStarted() ) {
                    break;
                }
                WatchUi.pushView(new ActivityClassMenu(), new ActivityClassMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :datafields:
                var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
                WatchUi.pushView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_LEFT);
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
                WatchUi.pushView(new UnitMenu(), new UnitMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :extra:
                WatchUi.pushView(new ExtraMenu(), new ExtraMenuDelegate(), WatchUi.SLIDE_LEFT);
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