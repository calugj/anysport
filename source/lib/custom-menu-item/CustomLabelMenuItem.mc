import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class CustomLabelMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;

    private var BACKGROUND_COLOR;
    private var FOREGROUND_COLOR;
    private var DEVICE_FAMILY;
    private var FOCUSED;

    public function initialize(param_id, param_label as String) {
        CustomMenuItem.initialize(param_id, {});
        label = param_label;

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
                FOCUSED = Graphics.FONT_LARGE;
                break;
            case DeviceFamily.F8:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                FOCUSED = Graphics.FONT_LARGE;
                break;
            case DeviceFamily.FR70:
                BACKGROUND_COLOR = Graphics.COLOR_BLACK;
                FOREGROUND_COLOR = Graphics.COLOR_WHITE;
                FOCUSED = Graphics.FONT_LARGE;
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
        dc.drawText(dc.getWidth()*0.1, dc.getHeight() / 2, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}