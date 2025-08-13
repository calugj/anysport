import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.Communications;

public class MainMenuExtra extends MenuBaseClass {

    public function initialize() {
        var title = "";
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomIconMenuItem(:about, Strings.getString("About"), Strings.getString("About_substring"), WatchUi.loadResource($.Rez.Drawables.About)));
        addItem(new CustomIconMenuItem(:dev, Strings.getString("Dev"), Strings.getString("Dev_substring"), WatchUi.loadResource($.Rez.Drawables.Dev)));
        addItem(new CustomIconMenuItem(:git, Strings.getString("Git"), Strings.getString("Git_substring"), WatchUi.loadResource($.Rez.Drawables.Git)));
        addItem(new CustomIconMenuItem(:licenses, Strings.getString("Licenses"), Strings.getString("Licenses_substring"), WatchUi.loadResource($.Rez.Drawables.Licenses)));
    }

    public function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        var bitmap = WatchUi.loadResource(Rez.Drawables.Up);
        dc.drawBitmap(dc.getWidth()*0.4 - bitmap.getWidth()/2, dc.getHeight()*0.5 - bitmap.getHeight()/2, bitmap);
        bitmap = WatchUi.loadResource(Rez.Drawables.Settings);
        dc.drawBitmap(dc.getWidth()*0.6 - bitmap.getWidth()/2, dc.getHeight()*0.5 - bitmap.getHeight()/2, bitmap);
    }
}


public class MainMenuExtraDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {

        switch(item.getId()) {
            case :about:
                WatchUi.pushView(new AboutView(), new BehaviorDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :dev:
                WatchUi.pushView(new DevView(), new BehaviorDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :git:
                Communications.openWebPage("https://github.com/calugj/anysport", null ,null);
                break;
            case :licenses:
                var view = new CustomScrollableDialog();
                var string = Strings.getString("LicensesDialog");
                WatchUi.pushView(view, new LicensesDialogDelegate(view, string, false), WatchUi.SLIDE_BLINK);
                break;
        }
        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_BLINK);
        var loop = new WatchUi.ViewLoop(new MainLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_BLINK);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        if(key == WatchUi.KEY_UP) {
            var menu = new MainMenu();
            menu = MenuUtils.setFocus(menu, :reference);
            WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_DOWN);
        }
        return false;
    }

    public function onTitle() as Void {
        onWrap(WatchUi.KEY_UP);
    }
}