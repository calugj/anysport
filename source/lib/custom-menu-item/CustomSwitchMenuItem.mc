import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class CustomSwitchMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;
    private var sublabel as String;
    private var flag as Boolean;

    private var BACKGROUND_COLOR;
    private var FOREGROUND_COLOR;
    private var DEVICE_FAMILY;
    private var FOCUSED;

    public function initialize(param_id, param_label as String, param_sublabel as String or Null, param_flag as Boolean) {
        CustomMenuItem.initialize(param_id, {});
        sublabel = param_sublabel;
        label = param_label;
        flag = param_flag;

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


    public function isActivated() {
        return flag;
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

        dc.setPenWidth(dc.getWidth()*0.01);

        if(flag) {
            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
            dc.fillRoundedRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.11, dc.getWidth()*0.2, dc.getHeight()*0.25, dc.getWidth()*0.05);
            
            dc.setColor(FOREGROUND_COLOR, Graphics.COLOR_TRANSPARENT);
            dc.drawRoundedRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.105, dc.getWidth()*0.2, dc.getHeight()*0.25, dc.getWidth()*0.05);
            
            dc.fillCircle(dc.getWidth()*0.91, dc.getHeight()/2, dc.getWidth()*0.04);

            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
            dc.fillCircle(dc.getWidth()*0.91, dc.getHeight()/2, dc.getWidth()*0.03);

        } else {
            dc.drawRoundedRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.11, dc.getWidth()*0.2, dc.getHeight()*0.25, dc.getWidth()*0.05);
            dc.fillCircle(dc.getWidth()*0.79, dc.getHeight()/2, dc.getWidth()*0.04);
        }
    }
}