import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class Datafield {
    protected var width as Number;
    protected var x as Number;
    protected var height as Number;
    protected var y as Number;
    protected var value as Array<String>;

    protected var foregroundColor as Number = 0;
    protected var backgroundColor as Number  = 0;

    public function initialize(param_x as Number, param_y as Number, param_width as Number, param_height as Number, param_value as Array<String>) {
        width = param_width;
        height = param_height;
        x = param_x;
        y = param_y;
        value = param_value;

        doStuff();
    }

    public function doStuff() as Void {
        backgroundColor = Properties.getValue("BackgroundColor") as Number;
    }

    public function updateValue(param_value as Array<String>) as Void {
        value = param_value;
        if(backgroundColor == Graphics.COLOR_BLACK) {
            foregroundColor = Graphics.COLOR_WHITE;
        } else {
            foregroundColor = Graphics.COLOR_BLACK;
        }
    }

    public function draw(dc as Dc) as Void {
        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x + width/2, y + height*0.18, Graphics.FONT_XTINY, value[1], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}