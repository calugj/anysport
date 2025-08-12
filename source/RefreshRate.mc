import Toybox.Lang;

public class RefreshRate {

    public static enum {
        REFRESH_LOW = 250,
        REFRESH_HIGH = 50,
    }
    
    private static var instance;

    private var timer;
    private var refresh;

    public function initialize() {
        refresh = REFRESH_LOW;
        timer = new Timer.Timer();
        timer.start(method(:timerCallback), refresh, true);
    }

    public static function getInstance() {
        if(instance == null) {
            instance = new RefreshRate();
        }
        return instance;
    }

    public function setRefreshRate(param_refreshRate) {
        refresh = param_refreshRate;
        timer.stop();
        timer.start(method(:timerCallback), param_refreshRate, true);
    }

    public function getRefresh() as Number {
        return refresh;
    }

    public function timerCallback() as Void {
        WatchUi.requestUpdate();
    }
}