import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Position;
import Toybox.Application;
import Toybox.Communications;

public class ThemeMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Theme);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomIconMenuItem(:backgroundColor, WatchUi.loadResource(Rez.Strings.BackgroundColor), "HEX " + Properties.getValue("BackgroundColor").format("%06X"), WatchUi.loadResource($.Rez.Drawables.Fill)));
        addItem(new CustomIconMenuItem(:accentColor, WatchUi.loadResource(Rez.Strings.AccentColor), "HEX " + Properties.getValue("AccentColor").format("%06X"), WatchUi.loadResource($.Rez.Drawables.Color)));
    }
}


public class ThemeMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        switch(item.getId()) {
            case :backgroundColor:
                WatchUi.pushView(new BackgroundColorMenu(), new BackgroundColorMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :accentColor:
                WatchUi.pushView(new AccentColorMenu(), new AccentColorMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
        }
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var menu = new MainMenu();
        menu = MenuUtils.setFocus(menu, :theme);
        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}