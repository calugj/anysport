public class LicensesDialogDelegate extends CustomScrollableDialogDelegate {
    public function initialize(mView, mString, mReadAll) {
        CustomScrollableDialogDelegate.initialize(mView, mString, mReadAll);
    }

    protected function onConfirm() as Void {
        onBack();    
    }
}