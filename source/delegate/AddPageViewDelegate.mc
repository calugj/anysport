import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

public class AddPageViewDelegate extends WatchUi.BehaviorDelegate {
    
    public function initialize() {
        BehaviorDelegate.initialize();
    }

    public function onMenu() as Boolean {
        return true;
    }

    public function onSelect() {
        var pages = Properties.getValue("Pages") as Number;
        if(pages < PageSettingLoopFactory.MAX_PAGES) {
            Properties.setValue("Pages", pages + 1);
        }
        
        var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:page => pages,:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_IMMEDIATE);
        WatchUi.requestUpdate();
        return true;
    }

    public function onBack() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var menu = new MainMenu();
        menu = MenuUtils.setFocus(menu, :datafields);

        WatchUi.switchToView(menu as MainMenu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
        return true;
    }

    public function onNextPage() as Boolean {
        return false;
    }

    public function onPreviousPage() as Boolean {
        return false;
    }
}