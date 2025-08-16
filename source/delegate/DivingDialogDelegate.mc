import Toybox.Lang;

public class DivingDialogDelegate extends CustomScrollableDialogDelegate {
    public function initialize(mView as CustomScrollableDialog, mString as String, mReadAll as Boolean) {
        CustomScrollableDialogDelegate.initialize(mView, mString, mReadAll);
    }

    protected function onConfirm() as Void {
        WatchUi.switchToView(new DivingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);  
    }
}