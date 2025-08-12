import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class AboutView extends WatchUi.View {

    public function initialize() {
        View.initialize();
    }


    public function onUpdate(dc) {
        View.onUpdate(dc);
        if(Toybox.Graphics.Dc has :setAntiAlias) {
            dc.setAntiAlias(true);
        }
        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(Graphics.COLOR_DK_GREEN, Graphics.COLOR_DK_GREEN);
        dc.clear();

        var bitmap = WatchUi.loadResource(Rez.Drawables.AS);
        dc.drawBitmap(dc.getWidth()/2 - bitmap.getWidth()/2, dc.getHeight()*0.28 - bitmap.getHeight()/2, bitmap);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        dc.drawText(width/2, height*0.48, Graphics.FONT_TINY, WatchUi.loadResource(Rez.Strings.AppNameFull), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(width/2, height*0.58, Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Version), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var text = "Built with <3 by\nLuca Boscolo Meneguolo";
        dc.drawText(width/2, height*0.75, Graphics.FONT_XTINY, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}