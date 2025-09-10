import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Application;

public class CustomSportNumberPickerDelegate extends CustomNumberPickerDelegate {
    
    public function initialize(mView as CustomNumberPicker, mInitialValue as Numeric, mMIN_VAL as Numeric, mMAX_VAL as Numeric, mIncrement as Numeric) {
        CustomNumberPickerDelegate.initialize(mView , mInitialValue, mMIN_VAL, mMAX_VAL, mIncrement);
    }

    public function onConfirm() {
        Properties.setValue("CustomSport", getValue());
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}

public class CustomSubsportNumberPickerDelegate extends CustomNumberPickerDelegate {
    
    public function initialize(mView as CustomNumberPicker, mInitialValue as Numeric, mMIN_VAL as Numeric, mMAX_VAL as Numeric, mIncrement as Numeric) {
        CustomNumberPickerDelegate.initialize(mView , mInitialValue, mMIN_VAL, mMAX_VAL, mIncrement);
    }

    public function onConfirm() {
        Properties.setValue("CustomSubsport", getValue());
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}