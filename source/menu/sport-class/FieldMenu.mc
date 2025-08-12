import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class FieldMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Field);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("64.85," + WatchUi.loadResource(Rez.Strings.Field_Padel), WatchUi.loadResource(Rez.Strings.Field_Padel)));
        addItem(new CustomLabelMenuItem("8.0," + WatchUi.loadResource(Rez.Strings.Field_Tennis), WatchUi.loadResource(Rez.Strings.Field_Tennis)));
        addItem(new CustomLabelMenuItem("7.0," + WatchUi.loadResource(Rez.Strings.Field_Soccer), WatchUi.loadResource(Rez.Strings.Field_Soccer)));
        addItem(new CustomLabelMenuItem("75.0," + WatchUi.loadResource(Rez.Strings.Field_Volleyball), WatchUi.loadResource(Rez.Strings.Field_Volleyball)));
        addItem(new CustomLabelMenuItem("6.0," + WatchUi.loadResource(Rez.Strings.Field_Basketball), WatchUi.loadResource(Rez.Strings.Field_Basketball)));
        addItem(new CustomLabelMenuItem("9.0," + WatchUi.loadResource(Rez.Strings.Field_AmericanFootball), WatchUi.loadResource(Rez.Strings.Field_AmericanFootball)));
        addItem(new CustomLabelMenuItem("49.0," + WatchUi.loadResource(Rez.Strings.Field_Baseball), WatchUi.loadResource(Rez.Strings.Field_Baseball)));
        addItem(new CustomLabelMenuItem("72.0," + WatchUi.loadResource(Rez.Strings.Field_Rugby), WatchUi.loadResource(Rez.Strings.Field_Rugby)));
        addItem(new CustomLabelMenuItem("73.0," + WatchUi.loadResource(Rez.Strings.Field_Hockey), WatchUi.loadResource(Rez.Strings.Field_Hockey)));
        addItem(new CustomLabelMenuItem("64.94," + WatchUi.loadResource(Rez.Strings.Field_Squash), WatchUi.loadResource(Rez.Strings.Field_Squash)));
        addItem(new CustomLabelMenuItem("64.84," + WatchUi.loadResource(Rez.Strings.Field_Pickleball), WatchUi.loadResource(Rez.Strings.Field_Pickleball)));
        addItem(new CustomLabelMenuItem("64.95," + WatchUi.loadResource(Rez.Strings.Field_Badminton), WatchUi.loadResource(Rez.Strings.Field_Badminton)));
        addItem(new CustomLabelMenuItem("64.96," + WatchUi.loadResource(Rez.Strings.Field_Racquetball), WatchUi.loadResource(Rez.Strings.Field_Racquetball)));
        addItem(new CustomLabelMenuItem("64.97," + WatchUi.loadResource(Rez.Strings.Field_TableTennis), WatchUi.loadResource(Rez.Strings.Field_TableTennis)));
        addItem(new CustomLabelMenuItem("71.0," + WatchUi.loadResource(Rez.Strings.Field_Cricket), WatchUi.loadResource(Rez.Strings.Field_Cricket)));
        addItem(new CustomLabelMenuItem("74.0," + WatchUi.loadResource(Rez.Strings.Field_Lacrosse), WatchUi.loadResource(Rez.Strings.Field_Lacrosse)));
        addItem(new CustomLabelMenuItem("50.0," + WatchUi.loadResource(Rez.Strings.Field_Softball), WatchUi.loadResource(Rez.Strings.Field_Softball)));
    }
}