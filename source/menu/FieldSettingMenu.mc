import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.Activity;
import Toybox.SensorHistory;

public class FieldSettingMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Field);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem(0 , Strings.getInstance().getString("Timer")));
        addItem(new CustomLabelMenuItem(1 , Strings.getInstance().getString("LapTimer")));
        addItem(new CustomLabelMenuItem(2 , Strings.getInstance().getString("LastLapTimer")));
        addItem(new CustomLabelMenuItem(3 , Strings.getInstance().getString("AverageLap")));
        addItem(new CustomLabelMenuItem(4 , Strings.getInstance().getString("ElapsedTime")));
        addItem(new CustomLabelMenuItem(5 , Strings.getInstance().getString("Distance")));
        addItem(new CustomLabelMenuItem(6 , Strings.getInstance().getString("LapDistance")));
        addItem(new CustomLabelMenuItem(7 , Strings.getInstance().getString("LastLapDistance")));
        addItem(new CustomLabelMenuItem(8 , Strings.getInstance().getString("Pace")));
        addItem(new CustomLabelMenuItem(9 , Strings.getInstance().getString("AveragePace")));
        addItem(new CustomLabelMenuItem(10 , Strings.getInstance().getString("AverageLapPace")));
        addItem(new CustomLabelMenuItem(11 , Strings.getInstance().getString("LastLapPace")));
        addItem(new CustomLabelMenuItem(12 , Strings.getInstance().getString("MaxPace")));
        addItem(new CustomLabelMenuItem(13 , Strings.getInstance().getString("Speed")));
        addItem(new CustomLabelMenuItem(14 , Strings.getInstance().getString("AverageSpeed")));
        addItem(new CustomLabelMenuItem(15 , Strings.getInstance().getString("AverageLapSpeed")));
        addItem(new CustomLabelMenuItem(16 , Strings.getInstance().getString("LastLapSpeed")));
        addItem(new CustomLabelMenuItem(17 , Strings.getInstance().getString("MaxSpeed")));
        addItem(new CustomLabelMenuItem(18 , Strings.getInstance().getString("HeartRate")));
        addItem(new CustomLabelMenuItem(31 , Strings.getInstance().getString("HeartRateColor")));
        addItem(new CustomLabelMenuItem(19 , Strings.getInstance().getString("AverageHeartRate")));
        addItem(new CustomLabelMenuItem(20 , Strings.getInstance().getString("MaxHeartRate")));
        if(SensorHistory has :getTemperatureHistory) {
            addItem(new CustomLabelMenuItem(21 , Strings.getInstance().getString("Temperature")));
        }
        addItem(new CustomLabelMenuItem(22 , Strings.getInstance().getString("Altitude")));
        addItem(new CustomLabelMenuItem(23 , Strings.getInstance().getString("TotalAscent")));
        addItem(new CustomLabelMenuItem(24 , Strings.getInstance().getString("TotalDescent")));
        addItem(new CustomLabelMenuItem(25 , Strings.getInstance().getString("Compass")));
        addItem(new CustomLabelMenuItem(26 , Strings.getInstance().getString("Cadence")));
        addItem(new CustomLabelMenuItem(27 , Strings.getInstance().getString("Calories")));
        addItem(new CustomLabelMenuItem(28 , Strings.getInstance().getString("Battery")));
        addItem(new CustomLabelMenuItem(29 , Strings.getInstance().getString("LapCount")));
        addItem(new CustomLabelMenuItem(30 , Strings.getInstance().getString("TimeOfDay")));
        addItem(new CustomLabelMenuItem(32 , Strings.getInstance().getString("Power")));
        if(Activity.Info has :rawAmbientPressure) {
            addItem(new CustomLabelMenuItem(33 , Strings.getInstance().getString("RawPressure")));
        }
        if(Activity.Info has :meanSeaLevelPressure) {
            addItem(new CustomLabelMenuItem(34 , Strings.getInstance().getString("SeaPressure")));
        }

        
    }
}


public class FieldSettingMenuDelegate extends Menu2InputDelegate {
    
    var page;
    var field;
    
    public function initialize(param_page as Number, param_field as Number) {
        Menu2InputDelegate.initialize();
        page = param_page;
        field = param_field;    
    }

    public function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        
        Properties.setValue("Field" + field.toString() + "Page" + page.toString(), id);
        onBack();

        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var view = new PageSettingView(page, true);
        view.setPosition(field - 1);
        WatchUi.switchToView(view, new FieldSettingViewDelegate(view, page, field - 1), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}


public class LapFieldSettingMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        Properties.setValue("LapScreenField", item.getId());
        onBack();
    }

    public function onBack() as Void {
        var menu = new LapMenu();
        menu = MenuUtils.setFocus(menu, :lapField);
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        WatchUi.switchToView(menu, new LapMenuDelegate(), WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}