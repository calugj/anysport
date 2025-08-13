import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class OtherMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Other");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("18.0," + Strings.getString("Other_Multisport"), Strings.getString("Other_Multisport")));
        addItem(new CustomLabelMenuItem("25.0," + Strings.getString("Other_Golf"), Strings.getString("Other_Golf")));
        addItem(new CustomLabelMenuItem("27.0," + Strings.getString("Other_Horseback"), Strings.getString("Other_Horseback")));
        addItem(new CustomLabelMenuItem("28.0," + Strings.getString("Other_Hunt"), Strings.getString("Other_Hunt")));
        addItem(new CustomLabelMenuItem("28.72," + Strings.getString("Other_HuntDog"), Strings.getString("Other_HuntDog")));
        addItem(new CustomLabelMenuItem("29.0," + Strings.getString("Other_Fish"), Strings.getString("Other_Fish")));
        addItem(new CustomLabelMenuItem("30.0," + Strings.getString("Other_InlineSkate"), Strings.getString("Other_InlineSkate")));
        addItem(new CustomLabelMenuItem("45.0," + Strings.getString("Other_Tactical"), Strings.getString("Other_Tactical")));
        addItem(new CustomLabelMenuItem("47.0," + Strings.getString("Other_Boxe"), Strings.getString("Other_Boxe")));
        addItem(new CustomLabelMenuItem("80.0," + Strings.getString("Other_MMA"), Strings.getString("Other_MMA")));
        addItem(new CustomLabelMenuItem("83.0," + Strings.getString("Other_Dance"), Strings.getString("Other_Dance")));
        addItem(new CustomLabelMenuItem("69.0," + Strings.getString("Other_DiscGolf"), Strings.getString("Other_DiscGolf")));
        addItem(new CustomLabelMenuItem("67.0," + Strings.getString("Other_Meditation"), Strings.getString("Other_Meditation")));
        addItem(new CustomLabelMenuItem("10.62," + Strings.getString("Other_Breathing"), Strings.getString("Other_Breathing")));
        addItem(new CustomLabelMenuItem("59.0," + Strings.getString("Other_Offshore"), Strings.getString("Other_Offshore")));
        addItem(new CustomLabelMenuItem("63.77," + Strings.getString("Other_eSport"), Strings.getString("Other_eSport")));
        addItem(new CustomLabelMenuItem("56.0," + Strings.getString("Other_Shooting"), Strings.getString("Other_Shooting")));
    }
}