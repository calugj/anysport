import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

public class BackgroundColorMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("BackgroundColor");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomColorMenuItem(Graphics.COLOR_WHITE, Strings.getString("COLOR_WHITE"), "HEX " + Graphics.COLOR_WHITE.format("%06X"), Graphics.COLOR_WHITE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_BLACK, Strings.getString("COLOR_BLACK"), "HEX " + Graphics.COLOR_BLACK.format("%06X"), Graphics.COLOR_BLACK));

        MenuUtils.setFocus(self, Properties.getValue("BackgroundColor") as Number);
    }
}


public class BackgroundColorMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        var color = item.getId() as Number;
        Properties.setValue("BackgroundColor", color);

        onBack();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}