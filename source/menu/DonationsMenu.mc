import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Position;
import Toybox.Application;
import Toybox.Communications;

public class DonationsMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Donate");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelSublabelMenuItem(:e2, Strings.getString("2EUR"), Strings.getString("2EURSub")));
        addItem(new CustomLabelSublabelMenuItem(:e5, Strings.getString("5EUR"), Strings.getString("5EURSub")));
        addItem(new CustomLabelSublabelMenuItem(:e10, Strings.getString("10EUR"), Strings.getString("10EURSub")));
        addItem(new CustomLabelSublabelMenuItem(:custom, Strings.getString("CustomEUR"), Strings.getString("CustomEURSub")));
        addItem(new CustomLabelSublabelMenuItem(:free, Strings.getString("FreeEUR"), Strings.getString("FreeEURSub")));
    }
}


public class DonationsMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        switch(item.getId()) {
            case :e2:
                Communications.openWebPage("https://www.paypal.com/donate/?hosted_button_id=PH9A4UBNY2LS4", null ,null);
                break;
            case :e5:
                Communications.openWebPage("https://www.paypal.com/donate/?hosted_button_id=A94A4LZXKNFA6", null ,null);
                break;
            case :e10:
                Communications.openWebPage("https://www.paypal.com/donate/?hosted_button_id=8WHSD2KYNDNCS", null ,null);
                break;
            case :custom:
                Communications.openWebPage("https://www.paypal.com/donate/?hosted_button_id=T6QGEUC55838W", null ,null);
                break;
            case :free:
                onBack();
                return;
        }
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        var view = new CustomScrollableDialog();
        var string = Strings.getString("DonationDialog");
        WatchUi.pushView(view, new DonationsDialogDelegate(view, string, false), WatchUi.SLIDE_BLINK);
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}