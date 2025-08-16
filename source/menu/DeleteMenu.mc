import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Application;

public class DeleteMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Delete");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        (RefreshRate.getInstance() as RefreshRate).setRefreshRate(RefreshRate.REFRESH_HIGH);

        addItem(new CustomIconMenuItem(:yes, Strings.getString("Yes"), null, WatchUi.loadResource($.Rez.Drawables.Check) as BitmapResource));
        addItem(new CustomIconMenuItem(:no, Strings.getString("No"), null, WatchUi.loadResource($.Rez.Drawables.Cross) as BitmapResource));
    }
}


public class DeleteMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        switch(item.getId() as Object) {
            case :yes:
                (SportData.getInstance() as SportData).discard();
                WatchUi.popView(WatchUi.SLIDE_BLINK);
                WatchUi.popView(WatchUi.SLIDE_BLINK);
                break;
            case :no:
                onBack();
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