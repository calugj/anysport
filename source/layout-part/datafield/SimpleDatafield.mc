import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

public class SimpleDatafield extends Datafield {

    public function initialize(param_x as Number, param_y as Number, param_width as Number, param_height as Number, param_value as Array<String>) {
        Datafield.initialize(param_x, param_y, param_width, param_height, param_value);
    }
    
    public function draw(dc as Dc) as Void {
        Datafield.draw(dc);

        var font = Graphics.FONT_LARGE;
        if(width == dc.getWidth()) {
            font = Graphics.FONT_NUMBER_MILD;
        }
        else if(height == dc.getHeight()/2) {
            font = Graphics.FONT_NUMBER_MEDIUM;
        }
        else if(height == dc.getHeight()) {
            font = Graphics.FONT_NUMBER_HOT;
        }

        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x + width/2, y + height*0.6, font, value[0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}
