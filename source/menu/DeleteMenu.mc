import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Application;

public class DeleteMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Delete);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        RefreshRate.getInstance().setRefreshRate(RefreshRate.REFRESH_HIGH);

        addItem(new CustomIconMenuItem(:yes, WatchUi.loadResource(Rez.Strings.Yes), null, WatchUi.loadResource($.Rez.Drawables.Check)));
        addItem(new CustomIconMenuItem(:no, WatchUi.loadResource(Rez.Strings.No), null, WatchUi.loadResource($.Rez.Drawables.Cross)));
    }
}


public class DeleteMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        switch(item.getId()) {
            case :yes:
                SportData.getInstance().discard();
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