import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

public class AccentColorMenu extends MenuBaseClass {
    
    

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.AccentColor);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null}); 

        addItem(new CustomColorMenuItem(Graphics.COLOR_WHITE, Strings.getInstance().getString("COLOR_WHITE"), "HEX " + Graphics.COLOR_WHITE.format("%06X"), Graphics.COLOR_WHITE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_LT_GRAY, Strings.getInstance().getString("COLOR_LT_GRAY"), "HEX " + Graphics.COLOR_LT_GRAY.format("%06X"), Graphics.COLOR_LT_GRAY));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_GRAY, Strings.getInstance().getString("COLOR_DK_GRAY"), "HEX " + Graphics.COLOR_DK_GRAY.format("%06X"), Graphics.COLOR_DK_GRAY));
        addItem(new CustomColorMenuItem(Graphics.COLOR_BLACK, Strings.getInstance().getString("COLOR_BLACK"), "HEX " + Graphics.COLOR_BLACK.format("%06X"), Graphics.COLOR_BLACK));
        addItem(new CustomColorMenuItem(Graphics.COLOR_RED, Strings.getInstance().getString("COLOR_RED"), "HEX " + Graphics.COLOR_RED.format("%06X"), Graphics.COLOR_RED));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_RED, Strings.getInstance().getString("COLOR_DK_RED"), "HEX " + Graphics.COLOR_DK_RED.format("%06X"), Graphics.COLOR_DK_RED));
        addItem(new CustomColorMenuItem(Graphics.COLOR_ORANGE, Strings.getInstance().getString("COLOR_ORANGE"), "HEX " + Graphics.COLOR_ORANGE.format("%06X"), Graphics.COLOR_ORANGE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_YELLOW, Strings.getInstance().getString("COLOR_YELLOW"), "HEX " + Graphics.COLOR_YELLOW.format("%06X"), Graphics.COLOR_YELLOW));
        addItem(new CustomColorMenuItem(Graphics.COLOR_GREEN, Strings.getInstance().getString("COLOR_GREEN"), "HEX " + Graphics.COLOR_GREEN.format("%06X"), Graphics.COLOR_GREEN));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_GREEN, Strings.getInstance().getString("COLOR_DK_GREEN"), "HEX " + Graphics.COLOR_DK_GREEN.format("%06X"), Graphics.COLOR_DK_GREEN));
        addItem(new CustomColorMenuItem(Graphics.COLOR_BLUE, Strings.getInstance().getString("COLOR_BLUE"), "HEX " + Graphics.COLOR_BLUE.format("%06X"), Graphics.COLOR_BLUE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_BLUE, Strings.getInstance().getString("COLOR_DK_BLUE"), "HEX " + Graphics.COLOR_DK_BLUE.format("%06X"), Graphics.COLOR_DK_BLUE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_PURPLE, Strings.getInstance().getString("COLOR_PURPLE"), "HEX " + Graphics.COLOR_PURPLE.format("%06X"), Graphics.COLOR_PURPLE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_PINK, Strings.getInstance().getString("COLOR_PINK"), "HEX " + Graphics.COLOR_PINK.format("%06X"), Graphics.COLOR_PINK));
        addItem(new CustomColorMenuItem(Graphics.COLOR_TRANSPARENT, Strings.getInstance().getString("COLOR_TRANSPARENT"), "HEX " + Graphics.COLOR_TRANSPARENT.format("%06X"), Graphics.COLOR_TRANSPARENT));
        
        MenuUtils.setFocus(self, Properties.getValue("AccentColor"));
    }
}


public class AccentColorMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        Properties.setValue("AccentColor", item.getId());

        var menu = new ThemeMenu();
        menu = MenuUtils.setFocus(menu, :accentColor);

        onBack();
        WatchUi.switchToView(menu, new ThemeMenuDelegate(), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}