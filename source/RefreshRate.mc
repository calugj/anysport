import Toybox.Lang;
import Toybox.Timer;

public class RefreshRate {

    public static enum {
        REFRESH_LOW = 250,
        REFRESH_HIGH = 50,
    }
    
    private static var instance as RefreshRate?;

    private var timer as Timer.Timer?;
    private var refresh as Number;

    public function initialize() {
        refresh = REFRESH_LOW;
        timer = new Timer.Timer();
        timer.start(method(:timerCallback), refresh, true);
    }

    public static function getInstance() as RefreshRate?{
        if(instance == null) {
            instance = new RefreshRate();
        }
        return instance;
    }

    public function setRefreshRate(param_refreshRate as Number) as Void {
        refresh = param_refreshRate;
        if(timer != null) {
            timer.stop();
        }
        timer = new Timer.Timer();
        timer.start(method(:timerCallback), param_refreshRate, true);
    }

    public function getRefresh() as Number {
        return refresh;
    }

    public function timerCallback() as Void {
        WatchUi.requestUpdate();
    }
}