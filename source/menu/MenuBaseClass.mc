import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class MenuBaseClass extends CustomMenu {
    
    protected var ITEM_HEIGHT as Number;
    protected var DEVICE_FAMILY as Number;
    protected var FOREGROUND_COLOR as Number;
    protected var BACKGROUND_COLOR as Number;
    protected var TITLE as String;

    public function initialize(title as String, itemHeight as Number, options as Dictionary?) {
        DEVICE_FAMILY = DeviceFamily.getFamily();
        switch(DEVICE_FAMILY) {
            case DeviceFamily.F6:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                break;
            case DeviceFamily.F7:
                BACKGROUND_COLOR = Graphics.COLOR_BLACK;
                FOREGROUND_COLOR = Graphics.COLOR_WHITE;
                break;
            case DeviceFamily.F8:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                break;
            case DeviceFamily.FR70:
                BACKGROUND_COLOR = Graphics.COLOR_BLACK;
                FOREGROUND_COLOR = Graphics.COLOR_WHITE;
                break;
            case DeviceFamily.VIVO:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                break;
            default:
                BACKGROUND_COLOR = Graphics.COLOR_WHITE;
                FOREGROUND_COLOR = Graphics.COLOR_BLACK;
                break;
        }

        ITEM_HEIGHT = itemHeight;
        TITLE = title;

        CustomMenu.initialize(ITEM_HEIGHT, BACKGROUND_COLOR, options as Dictionary?);
    }

    public function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, TITLE, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    public function drawForeground(dc as Dc) {
        if(DEVICE_FAMILY == DeviceFamily.F6 || DEVICE_FAMILY == DeviceFamily.F8 || DEVICE_FAMILY == DeviceFamily.FR70) {
            var width = dc.getWidth();
            var height = dc.getHeight();
            dc.setColor(FOREGROUND_COLOR, Graphics.COLOR_TRANSPARENT);
            dc.setPenWidth(width*0.015);
            dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        }   
    }

    public function updateItem(item as MenuItem, index as Number) as Void {
        if(self.findItemById(item.getId() as Object) == index && index != -1) {
            CustomMenu.updateItem(item, index);
        }
    }
}