import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Application;

public class AutoLapNumberPickerDelegate extends CustomNumberPickerDelegate {
    
    public function initialize(mView as CustomNumberPicker, mInitialValue as Numeric, mMIN_VAL as Numeric, mMAX_VAL as Numeric, mIncrement as Numeric) {
        CustomNumberPickerDelegate.initialize(mView , mInitialValue, mMIN_VAL, mMAX_VAL, mIncrement);
    }

    public function onConfirm() {
        Properties.setValue("AutoLapValue", getValue());
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}