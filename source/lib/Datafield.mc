import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class Datafield {
    protected var width = 0;
    protected var x = 0;
    protected var height = 0;
    protected var y = 0;
    protected var value as Array<String> = new Array<String> [2];

    protected var foregroundColor = 0;
    protected var backgroundColor = 0;

    public function initialize(param_x, param_y, param_width, param_height, param_value) {
        width = param_width;
        height = param_height;
        x = param_x;
        y = param_y;
        value = param_value;

        doStuff();
    }

    public function doStuff() {
        backgroundColor = Properties.getValue("BackgroundColor");
    }

    public function updateValue(param_value as Array<String>) as Void {
        value = param_value;
        if(backgroundColor == Graphics.COLOR_BLACK) {
            foregroundColor = Graphics.COLOR_WHITE;
        } else {
            foregroundColor = Graphics.COLOR_BLACK;
        }
    }

    public function draw(dc as Dc) {
        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x + width/2, y + height*0.18, Graphics.FONT_XTINY, value[1], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}