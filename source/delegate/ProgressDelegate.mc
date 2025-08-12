import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.Application;

public class ProgressDelegate extends WatchUi.BehaviorDelegate {
    
    var timer;

    function initialize() {
        BehaviorDelegate.initialize();

        timer = new Timer.Timer();
        timer.start(method(:timerCallback), 2000, false);
    }

    public function timerCallback() as Void {
        var saved = Properties.getValue("Saved") + 1;
        Properties.setValue("Saved", saved);
        if(saved == 5 || saved == 10 || saved == 15) {
            WatchUi.switchToView(new DonationsMenu(), new DonationsMenuDelegate(), WatchUi.SLIDE_LEFT);
            return;
        }
        WatchUi.popView(WatchUi.SLIDE_BLINK);
    }

    public function onSelect() as Boolean {
        return true;
    }

    public function onBack() as Boolean {
        if(timer != null) {
            timer.stop();
        }
        timerCallback();
        return true;
    }
}