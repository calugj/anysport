import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

public class SummaryViewDelegate extends WatchUi.BehaviorDelegate {

    public function initialize() {
        BehaviorDelegate.initialize();
    }

    public function onMenu() as Boolean {
        return true;
    }

    public function onSelect() {
        System.exit();
    }

    public function onBack() {
        System.exit();
    }
}