public class DivingDialogDelegate extends CustomScrollableDialogDelegate {
    public function initialize(mView, mString, mReadAll) {
        CustomScrollableDialogDelegate.initialize(mView, mString, mReadAll);
    }

    protected function onConfirm() as Void {
        WatchUi.switchToView(new DivingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);  
    }
}