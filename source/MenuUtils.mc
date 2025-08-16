import Toybox.Lang;
import Toybox.WatchUi;

public class MenuUtils {

    // Fixes a problem for Venu and Vivoactive watches
    public static function setFocus(menu as Menu2, id as Object) as Menu2 {
        var offset = 0;
        if(DeviceFamily.getFamily() == DeviceFamily.VIVO) {
            offset = 1;
        }
        menu.setFocus(menu.findItemById(id) + offset);
        return menu;
    }
}