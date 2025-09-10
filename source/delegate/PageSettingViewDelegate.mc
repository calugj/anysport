import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

public class PageSettingViewDelegate extends WatchUi.BehaviorDelegate {
    
    private var pageNumber as Number;

    public function initialize(param_view as PageSettingView, param_pageNumber as Number) {
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
        return true;
    }

    public function onNextPage() as Boolean {
        return false;
    }

    public function onPreviousPage() as Boolean {
        return false;
    }
}