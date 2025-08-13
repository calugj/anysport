import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class AddPageView extends WatchUi.View {

    public function initialize() {
        View.initialize();
    }


    public function onUpdate(dc) {
        View.onUpdate(dc);

        if(Toybox.Graphics.Dc has :setAntiAlias) {
            dc.setAntiAlias(true);
        }

        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.clear();

        var length = width*0.25;
        var depth = width*0.03;

        var color = Properties.getValue("AccentColor");
        if(color == Graphics.COLOR_WHITE || color == Graphics.COLOR_TRANSPARENT) {
            color = Graphics.COLOR_BLACK;
        }

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(width/2 - length/2, height*0.45 - depth/2, length, depth);
        dc.fillRectangle(width/2 - depth/2, height*0.45 - length/2, depth, length);
        
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width/2, height*0.65, Graphics.FONT_TINY, Strings.getString("AddPage"), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}