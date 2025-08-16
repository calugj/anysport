import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class CustomIconMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;
    private var sublabel as String?;
    private var icon as BitmapResource;

    private var BACKGROUND_COLOR as Number;
    private var DEVICE_FAMILY as Number;
    private var FOREGROUND_COLOR as Number;
    private var FOCUSED as FontDefinition;

    public function initialize(param_id as Object, param_label as String, param_sublabel as String?, param_icon as BitmapResource) {
        CustomMenuItem.initialize(param_id, {});
        sublabel = param_sublabel;
        label = param_label;
        icon = param_icon;
        

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

        var num;
        var space;
        if(dc.getWidth() == System.getDeviceSettings().screenWidth) {
            num = 1.2;
            space = icon.getWidth()*0.65;
        } else {
            num = 2;
            space = icon.getWidth()*0.5;
        }

        dc.setColor(FOREGROUND_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawBitmap(space, dc.getHeight()/2 - icon.getHeight()/2, icon);
        
        if(sublabel != null) {
            dc.drawText(icon.getWidth() + num*space, dc.getHeight()*0.35, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(icon.getWidth() + num*space, dc.getHeight()*0.75, Graphics.FONT_XTINY, sublabel, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        } else {
            dc.drawText(icon.getWidth() + num*space, dc.getHeight()*0.5, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }
}