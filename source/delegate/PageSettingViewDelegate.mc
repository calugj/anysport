import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

public class PageSettingViewDelegate extends WatchUi.BehaviorDelegate {
    
    private var pageNumber;

    public function initialize(param_view, param_pageNumber) {
        BehaviorDelegate.initialize();

        pageNumber = param_pageNumber;
    }

    public function onMenu() as Boolean {
        return true;
    }

    public function onSelect() {
        WatchUi.pushView(new EditPageMenu(pageNumber), new EditPageMenuDelegate(pageNumber), WatchUi.SLIDE_LEFT);
        WatchUi.requestUpdate();
        return true;
    }

    public function onBack() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var menu = new MainMenu();
        menu = MenuUtils.setFocus(menu, :datafields);

        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
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