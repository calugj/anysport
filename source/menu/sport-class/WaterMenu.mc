import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class WaterMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.WaterSports);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("32.0," + WatchUi.loadResource(Rez.Strings.Water_Sail), WatchUi.loadResource(Rez.Strings.Water_Sail)));
        addItem(new CustomLabelMenuItem("41.0," + WatchUi.loadResource(Rez.Strings.Water_Kayak), WatchUi.loadResource(Rez.Strings.Water_Kayak)));
        addItem(new CustomLabelMenuItem("19.0," + WatchUi.loadResource(Rez.Strings.Water_Paddle), WatchUi.loadResource(Rez.Strings.Water_Paddle)));
        addItem(new CustomLabelMenuItem("37.0," + WatchUi.loadResource(Rez.Strings.Water_SUP), WatchUi.loadResource(Rez.Strings.Water_SUP)));
        addItem(new CustomLabelMenuItem("42.0," + WatchUi.loadResource(Rez.Strings.Water_Raft), WatchUi.loadResource(Rez.Strings.Water_Raft)));
        addItem(new CustomLabelMenuItem("42.41," + WatchUi.loadResource(Rez.Strings.Water_Whitewater), WatchUi.loadResource(Rez.Strings.Water_Whitewater)));
        addItem(new CustomLabelMenuItem("15.0," + WatchUi.loadResource(Rez.Strings.Water_Row), WatchUi.loadResource(Rez.Strings.Water_Row)));
        addItem(new CustomLabelMenuItem("43.0," + WatchUi.loadResource(Rez.Strings.Water_Windsurf), WatchUi.loadResource(Rez.Strings.Water_Windsurf)));
        addItem(new CustomLabelMenuItem("44.0," + WatchUi.loadResource(Rez.Strings.Water_Kitesurf), WatchUi.loadResource(Rez.Strings.Water_Kitesurf)));
        addItem(new CustomLabelMenuItem("39.0," + WatchUi.loadResource(Rez.Strings.Water_Wakeboard), WatchUi.loadResource(Rez.Strings.Water_Wakeboard)));
        addItem(new CustomLabelMenuItem("77.0," + WatchUi.loadResource(Rez.Strings.Water_Wakesurf), WatchUi.loadResource(Rez.Strings.Water_Wakesurf)));
        addItem(new CustomLabelMenuItem("40.0," + WatchUi.loadResource(Rez.Strings.Water_Ski), WatchUi.loadResource(Rez.Strings.Water_Ski)));
        addItem(new CustomLabelMenuItem("38.0," + WatchUi.loadResource(Rez.Strings.Water_Surf), WatchUi.loadResource(Rez.Strings.Water_Surf)));
        addItem(new CustomLabelMenuItem("82.0," + WatchUi.loadResource(Rez.Strings.Water_Snorkel), WatchUi.loadResource(Rez.Strings.Water_Snorkel)));
        addItem(new CustomLabelMenuItem("76.0," + WatchUi.loadResource(Rez.Strings.Water_Tube), WatchUi.loadResource(Rez.Strings.Water_Tube))); 
    }
}