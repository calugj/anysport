import Toybox.WatchUi;
import Toybox.Application;

public class CustomNameTextPickerDelegate extends WatchUi.TextPickerDelegate {

    function initialize() {
        TextPickerDelegate.initialize();
    }

    function onTextEntered(text, changed) {
        Properties.setValue("CustomName", text);
        return true;
    }

    function onCancel() {
        return true;
    }
}