import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class CustomColorMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;
    private var sublabel as String;
    private var color as Number;

    private var BACKGROUND_COLOR;
    private var FOREGROUND_COLOR;
    private var DEVICE_FAMILY;
    private var FOCUSED;

    public function initialize(param_id, param_label as String, param_sublabel as String or Null, param_color as Number) {
        CustomMenuItem.initialize(param_id, {});
        sublabel = param_sublabel;
        label = param_label;
        color = param_color;

        DEVICE_FAMILY = DeviceFamily.getFamily();
        switch(DEVICE_FAMILY) {
            case DeviceFamily.F6:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                FOCUSED = Graphics.FONT_LARGE;
                break;
            case DeviceFamily.F7:
                BACKGROUND_COLOR = Graphics.COLOR_BLACK;
                FOREGROUND_COLOR = Graphics.COLOR_WHITE;
                FOCUSED = Graphics.FONT_SMALL;
                break;
            case DeviceFamily.F8:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                FOCUSED = Graphics.FONT_SMALL;
                break;
            case DeviceFamily.FR70:
                BACKGROUND_COLOR = Graphics.COLOR_BLACK;
                FOREGROUND_COLOR = Graphics.COLOR_WHITE;
                FOCUSED = Graphics.FONT_SMALL;
                break;
            case DeviceFamily.VIVO:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                FOCUSED = Graphics.FONT_SMALL;
                break;
            default:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                FOCUSED = Graphics.FONT_LARGE;
                break;
        }
    }


    public function draw(dc as Dc) as Void {
        dc.setAntiAlias(true);

        dc.setColor(BACKGROUND_COLOR, BACKGROUND_COLOR);
        
        var font = Graphics.FONT_SMALL;
        if (isFocused()) {
            font = FOCUSED;
        }

        dc.clear();

        dc.setColor(FOREGROUND_COLOR, Graphics.COLOR_TRANSPARENT);
        if(sublabel != null) {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.35, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.75, Graphics.FONT_XTINY, sublabel, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        } else {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.5, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        }

        dc.setColor(color, color);
        dc.fillRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.4, dc.getWidth()*0.2, dc.getHeight()*0.8);
        dc.setPenWidth(dc.getWidth()*0.01);
        dc.setColor(FOREGROUND_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.4, dc.getWidth()*0.2, dc.getHeight()*0.8);
    }
}