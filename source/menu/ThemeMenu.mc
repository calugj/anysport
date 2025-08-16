import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Position;
import Toybox.Application;
import Toybox.Communications;

public class ThemeMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Theme");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomIconMenuItem(:backgroundColor, Strings.getString("BackgroundColor"), "HEX " + (Properties.getValue("BackgroundColor") as Number).format("%06X"), WatchUi.loadResource($.Rez.Drawables.Fill) as BitmapResource));
        addItem(new CustomIconMenuItem(:accentColor, Strings.getString("AccentColor"), "HEX " + (Properties.getValue("AccentColor") as Number).format("%06X"), WatchUi.loadResource($.Rez.Drawables.Color) as BitmapResource));
    }
}


public class ThemeMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        switch(item.getId() as Object) {
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