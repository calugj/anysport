import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

public class MainViewDelegate extends BehaviorDelegate {
    
    private var view;
    private var timer;

    public function initialize(param_view, param_pageNumber) {
        BehaviorDelegate.initialize();

        view = param_view;
        timer = null;
    }

    public function onMenu() as Boolean {
        if(timer != null) {
            timer.stop();
            timer = null;
        }
        
        WatchUi.pushView(new MainMenu(), new MainMenuDelegate(), WatchUi.SLIDE_BLINK);
        return true;
    }

    private function onSimulatedSelect() {
        var sportData = SportData.getInstance();
        
        if(timer != null) {
            timer.stop();
            timer = null;
        }

        if(sportData.isRecording()) {
            sportData.stop();
            view.ring.setStatus(1);

            timer = new Timer.Timer();
            timer.start(method(:timerCallback), 2500, false);
        }
        else {
            sportData.start();
            view.ring.setStatus(2);
            view.topBanner.setStatus(3);
        }
        
        WatchUi.requestUpdate();
        return true;
    }


    public function timerCallback() as Void {
        WatchUi.pushView(new SaveMenu(), new SaveMenuDelegate(view), WatchUi.SLIDE_BLINK);
    }


    private function onSimulatedBack() {
        var sportData = SportData.getInstance();

        if(timer != null) {
            timer.stop();
            timer = null;
        }

        if(sportData.isRecording() && Properties.getValue("LapActivated")) {
            sportData.lap();
            view.ring.setStatus(3);
        } else if(!sportData.isRecording() && sportData.isRecordingStarted()) {
            WatchUi.pushView(new SaveMenu(), new SaveMenuDelegate(view), WatchUi.SLIDE_BLINK);
        } else if(!sportData.isRecording()) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        }

        WatchUi.requestUpdate();

        return false;
    }


    public function onNextPage() as Boolean {
        view.topBanner.setStatus(0);
        WatchUi.requestUpdate();
        return false;
    }

    public function onPreviousPage() as Boolean {
        view.topBanner.setStatus(0);
        WatchUi.requestUpdate();
        return false;
    }



    public function onSwipe(swipeEvent) as Boolean {

        if(swipeEvent.getDirection() == WatchUi.SWIPE_RIGHT) {
            if(!SportData.getInstance().isRecordingStarted()) {
                onSimulatedBack();
            }
            return true;
        }
        
        return false;
    }



    public function onKey(keyEvent) {
        switch(keyEvent.getKey()) {
            case WatchUi.KEY_ESC:
                onSimulatedBack();
                return true;
            case WatchUi.KEY_ENTER:
                onSimulatedSelect();
                return true;
        }
        return false;
    }

    public function onHold(clickEvent) as Boolean {
        if(clickEvent.getType() == WatchUi.CLICK_TYPE_HOLD) {
            onMenu();
            return true;
        }
        return false;
    }


    public function onTap(clickEvent) as Boolean {
        return true;
    }

    public function onBack() as Boolean {
        return false;
    }

}