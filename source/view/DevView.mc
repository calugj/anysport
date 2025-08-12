import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class DevView extends WatchUi.View {

    public function initialize() {
        View.initialize();

    }


    public function onUpdate(dc) {
        View.onUpdate(dc);

        dc.setAntiAlias(true);
        
        var width = dc.getWidth();
        var height = dc.getHeight();
        var dev = System.getDeviceSettings();
        var stat = System.getSystemStats();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var y = height * 0.25;
        var x = width * 0.12;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Firmware) + Lang.format("$1$.$2$", dev.firmwareVersion) , Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Monkey) + Lang.format("$1$.$2$.$3$", dev.monkeyVersion) , Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 2*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.App) + WatchUi.loadResource(Rez.Strings.Version) , Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 3*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Display) + dev.screenWidth.toString() + "×" + dev.screenHeight.toString() + " @20Hz", Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 4*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Part) + dev.partNumber, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);

        var uid1 = dev.uniqueIdentifier.substring(0, dev.uniqueIdentifier.length()/2);
        var uid2 = dev.uniqueIdentifier.substring(dev.uniqueIdentifier.length()/2, dev.uniqueIdentifier.length());
        dc.drawText(x, y + 5*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.UID) + uid1, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 6*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, "        " + uid2, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        
        var barWidth = width*0.6;
        var barHeight = height*0.04;
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(width/2 - barWidth/2, height*0.82 - barHeight/2, barWidth, barHeight);
        dc.setColor(Graphics.COLOR_DK_GREEN, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(width/2 - barWidth/2, height*0.82 - barHeight/2, barWidth*stat.usedMemory/stat.totalMemory, barHeight);
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width/2, height*0.88, Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Memory) + Lang.format("$1$/$2$", [stat.usedMemory/1024, stat.totalMemory/1024]), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}