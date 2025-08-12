import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class OtherMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.Other);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("18.0," + WatchUi.loadResource(Rez.Strings.Other_Multisport), WatchUi.loadResource(Rez.Strings.Other_Multisport)));
        addItem(new CustomLabelMenuItem("25.0," + WatchUi.loadResource(Rez.Strings.Other_Golf), WatchUi.loadResource(Rez.Strings.Other_Golf)));
        addItem(new CustomLabelMenuItem("27.0," + WatchUi.loadResource(Rez.Strings.Other_Horseback), WatchUi.loadResource(Rez.Strings.Other_Horseback)));
        addItem(new CustomLabelMenuItem("28.0," + WatchUi.loadResource(Rez.Strings.Other_Hunt), WatchUi.loadResource(Rez.Strings.Other_Hunt)));
        addItem(new CustomLabelMenuItem("28.72," + WatchUi.loadResource(Rez.Strings.Other_HuntDog), WatchUi.loadResource(Rez.Strings.Other_HuntDog)));
        addItem(new CustomLabelMenuItem("29.0," + WatchUi.loadResource(Rez.Strings.Other_Fish), WatchUi.loadResource(Rez.Strings.Other_Fish)));
        addItem(new CustomLabelMenuItem("30.0," + WatchUi.loadResource(Rez.Strings.Other_InlineSkate), WatchUi.loadResource(Rez.Strings.Other_InlineSkate)));
        addItem(new CustomLabelMenuItem("45.0," + WatchUi.loadResource(Rez.Strings.Other_Tactical), WatchUi.loadResource(Rez.Strings.Other_Tactical)));
        addItem(new CustomLabelMenuItem("47.0," + WatchUi.loadResource(Rez.Strings.Other_Boxe), WatchUi.loadResource(Rez.Strings.Other_Boxe)));
        addItem(new CustomLabelMenuItem("80.0," + WatchUi.loadResource(Rez.Strings.Other_MMA), WatchUi.loadResource(Rez.Strings.Other_MMA)));
        addItem(new CustomLabelMenuItem("83.0," + WatchUi.loadResource(Rez.Strings.Other_Dance), WatchUi.loadResource(Rez.Strings.Other_Dance)));
        addItem(new CustomLabelMenuItem("69.0," + WatchUi.loadResource(Rez.Strings.Other_DiscGolf), WatchUi.loadResource(Rez.Strings.Other_DiscGolf)));
        addItem(new CustomLabelMenuItem("67.0," + WatchUi.loadResource(Rez.Strings.Other_Meditation), WatchUi.loadResource(Rez.Strings.Other_Meditation)));
        addItem(new CustomLabelMenuItem("10.62," + WatchUi.loadResource(Rez.Strings.Other_Breathing), WatchUi.loadResource(Rez.Strings.Other_Breathing)));
        addItem(new CustomLabelMenuItem("59.0," + WatchUi.loadResource(Rez.Strings.Other_Offshore), WatchUi.loadResource(Rez.Strings.Other_Offshore)));
        addItem(new CustomLabelMenuItem("63.77," + WatchUi.loadResource(Rez.Strings.Other_eSport), WatchUi.loadResource(Rez.Strings.Other_eSport)));
        addItem(new CustomLabelMenuItem("56.0," + WatchUi.loadResource(Rez.Strings.Other_Shooting), WatchUi.loadResource(Rez.Strings.Other_Shooting)));
    }
}