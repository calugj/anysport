import Toybox.Lang;

public class DonationsDialogDelegate extends CustomScrollableDialogDelegate {
    public function initialize(mView as CustomScrollableDialog, mString as String, mReadAll as Boolean) {
        CustomScrollableDialogDelegate.initialize(mView, mString, mReadAll);
    }

    protected function onConfirm() as Void {
        onBack();    
    }
}