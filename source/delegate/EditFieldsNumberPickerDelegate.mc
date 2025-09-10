import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Application;

public class EditFieldsNumberPickerDelegate extends CustomNumberPickerDelegate {

    private var pageNumber as Number;
    
    public function initialize(mView as CustomNumberPicker, mInitialValue as Number, mMIN_VAL as Number, mMAX_VAL as Number, param_pageNumber as Number) {
        CustomNumberPickerDelegate.initialize(mView , mInitialValue, mMIN_VAL, mMAX_VAL, 1);
        pageNumber = param_pageNumber;
    }

    public function onConfirm() {
        Properties.setValue("FieldsPage" + pageNumber.toString(), getValue());
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}