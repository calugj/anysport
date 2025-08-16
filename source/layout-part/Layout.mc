import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

public class Layout {
    
    private var fields as Number;
    
    public function initialize(param_fields as Number) {
        fields = param_fields;
    }

    public function draw(dc as Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var backgroundColor = Properties.getValue("BackgroundColor") as Number;
        var foregroundColor = Properties.getValue("AccentColor") as Number;
        
        dc.setColor(backgroundColor, backgroundColor);
        dc.clear();
        
        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.01);

        switch(fields) {
            case 2:
                dc.drawLine(0, height/2 - 1, width, height/2 - 1);
                break;
            case 3:
                dc.drawLine(0, height/3 - 1, width, height/3 - 1);
                dc.drawLine(0, 2*height/3 - 1, width, 2*height/3 - 1);
                break;
            case 4:
                dc.drawLine(0, height/3 - 1, width, height/3 - 1);
                dc.drawLine(0, 2*height/3 - 1, width, 2*height/3 - 1);
                dc.drawLine(width/2 - 1, height/3 - 1, width/2 - 1, 2*height/3 - 1);
                break;
            case 5:
                dc.drawLine(0, height/4 - 1, width, height/4 - 1);
                dc.drawLine(0, height/2 - 1, width, height/2 - 1);
                dc.drawLine(0, 3*height/4 - 1, width, 3*height/4 - 1);
                dc.drawLine(width/2 - 1, height/2 - 1, width/2 - 1, 3*height/4 - 1);
                break;
            case 6:
                dc.drawLine(0, height/4 - 1, width, height/4 - 1);
                dc.drawLine(0, height/2 - 1, width, height/2 - 1);
                dc.drawLine(0, 3*height/4 - 1, width, 3*height/4 - 1);
                dc.drawLine(width/2 - 1, height/4 - 1, width/2 - 1, 3*height/4 - 1);
        }

        dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);

        if(System.getDeviceSettings().screenShape == System.SCREEN_SHAPE_ROUND) {
            dc.setPenWidth(width*0.06);
            dc.drawCircle(width/2, height/2, width/2);
        } else if(System.getDeviceSettings().screenShape == System.SCREEN_SHAPE_RECTANGLE) {
            dc.setPenWidth(width*0.06);
            dc.drawRectangle(0, 0, dc.getWidth(), dc.getHeight());
        }
    }
}