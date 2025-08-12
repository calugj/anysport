public class FlyingDialogDelegate extends CustomScrollableDialogDelegate {
    public function initialize(mView, mString, mReadAll) {
        CustomScrollableDialogDelegate.initialize(mView, mString, mReadAll);
    }

    protected function onConfirm() as Void {
        WatchUi.switchToView(new FlyingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);  
    }
}