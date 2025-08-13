import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class SummaryView extends WatchUi.View {

    private var BACKGROUND_COLOR;
    private var FOREGROUND_COLOR;
    private var ACCENT_COLOR;
    private var timer as Array<String>;
    private var distance as Array<String>;
    
    public function initialize(mTimer, mDistance) {
        View.initialize();
        timer = mTimer;
        distance = mDistance;
    }

    public function onLayout(dc as Dc) as Void {
        BACKGROUND_COLOR = Properties.getValue("BackgroundColor");
        if(BACKGROUND_COLOR == Graphics.COLOR_BLACK) {
            FOREGROUND_COLOR = Graphics.COLOR_WHITE;
        } else {
            FOREGROUND_COLOR = Graphics.COLOR_BLACK;
        }

        ACCENT_COLOR = Properties.getValue("AccentColor");
        if(ACCENT_COLOR == FOREGROUND_COLOR) {
            ACCENT_COLOR = Graphics.COLOR_TRANSPARENT;
        }
    }

    public function onUpdate(dc) {
        View.onUpdate(dc);
        if(Toybox.Graphics.Dc has :setAntiAlias) {
            dc.setAntiAlias(true);
        }

        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(BACKGROUND_COLOR, BACKGROUND_COLOR);
        dc.clear();

        dc.setColor(ACCENT_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, width, height*0.2);

        dc.setColor(FOREGROUND_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width/80);
        dc.drawArc(width/2, height/2, height/2*0.95, Graphics.ARC_COUNTER_CLOCKWISE, 23, 38);

        dc.drawText(width/2, height*0.12, Graphics.FONT_GLANCE, WatchUi.loadResource(Rez.Strings.Saved), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(width/2, height*0.33, Graphics.FONT_TINY, timer[1], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(width/2, height*0.47, Graphics.FONT_NUMBER_MEDIUM, timer[0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(width/2, height*0.66, Graphics.FONT_TINY, distance[1], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(width/2, height*0.80, Graphics.FONT_NUMBER_MEDIUM, distance[0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}