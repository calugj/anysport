import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Application;
import Toybox.Activity;

public class ExtraMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Extra");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomSwitchMenuItem(:autoPause, "", null, true));
    }

    public function onShow() {
        updateItem(
            new CustomSwitchMenuItem(:autoPause, Strings.getString("Autopause"), null, Properties.getValue("Autopause") as Boolean),
            findItemById(:autoPause)    
        );
    }
}


public class ExtraMenuDelegate extends Menu2InputDelegate {
    
    private var menu as ExtraMenu;
    
    public function initialize(_menu as ExtraMenu) {
        Menu2InputDelegate.initialize();

        menu = _menu;
    }

    public function onSelect(item as MenuItem) as Void {
        switch(item.getId() as Object) {
            case :autoPause:
                var flag = Properties.getValue("Autopause") as Boolean;
                Properties.setValue("Autopause", !flag);
                menu.onShow();
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