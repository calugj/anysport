import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class FieldMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Field");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("64.85," + Strings.getString("Field_Padel"), Strings.getString("Field_Padel")));
        addItem(new CustomLabelMenuItem("8.0," + Strings.getString("Field_Tennis"), Strings.getString("Field_Tennis")));
        addItem(new CustomLabelMenuItem("7.0," + Strings.getString("Field_Soccer"), Strings.getString("Field_Soccer")));
        addItem(new CustomLabelMenuItem("75.0," + Strings.getString("Field_Volleyball"), Strings.getString("Field_Volleyball")));
        addItem(new CustomLabelMenuItem("6.0," + Strings.getString("Field_Basketball"), Strings.getString("Field_Basketball")));
        addItem(new CustomLabelMenuItem("9.0," + Strings.getString("Field_AmericanFootball"), Strings.getString("Field_AmericanFootball")));
        addItem(new CustomLabelMenuItem("49.0," + Strings.getString("Field_Baseball"), Strings.getString("Field_Baseball")));
        addItem(new CustomLabelMenuItem("72.0," + Strings.getString("Field_Rugby"), Strings.getString("Field_Rugby")));
        addItem(new CustomLabelMenuItem("73.0," + Strings.getString("Field_Hockey"), Strings.getString("Field_Hockey")));
        addItem(new CustomLabelMenuItem("64.94," + Strings.getString("Field_Squash"), Strings.getString("Field_Squash")));
        addItem(new CustomLabelMenuItem("64.84," + Strings.getString("Field_Pickleball"), Strings.getString("Field_Pickleball")));
        addItem(new CustomLabelMenuItem("64.95," + Strings.getString("Field_Badminton"), Strings.getString("Field_Badminton")));
        addItem(new CustomLabelMenuItem("64.96," + Strings.getString("Field_Racquetball"), Strings.getString("Field_Racquetball")));
        addItem(new CustomLabelMenuItem("64.97," + Strings.getString("Field_TableTennis"), Strings.getString("Field_TableTennis")));
        addItem(new CustomLabelMenuItem("71.0," + Strings.getString("Field_Cricket"), Strings.getString("Field_Cricket")));
        addItem(new CustomLabelMenuItem("74.0," + Strings.getString("Field_Lacrosse"), Strings.getString("Field_Lacrosse")));
        addItem(new CustomLabelMenuItem("50.0," + Strings.getString("Field_Softball"), Strings.getString("Field_Softball")));
    }
}