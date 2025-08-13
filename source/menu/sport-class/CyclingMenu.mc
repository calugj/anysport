import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class CyclingMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("Cycling");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("2.0," + Strings.getString("Cycling_Generic"), Strings.getString("Cycling_Generic")));
        addItem(new CustomLabelMenuItem("2.7," + Strings.getString("Cycling_Road"), Strings.getString("Cycling_Road")));
        addItem(new CustomLabelMenuItem("2.8," + Strings.getString("Cycling_Mountain"), Strings.getString("Cycling_Mountain")));
        addItem(new CustomLabelMenuItem("2.46," + Strings.getString("Cycling_Gravel"), Strings.getString("Cycling_Gravel")));
        addItem(new CustomLabelMenuItem("2.6," + Strings.getString("Cycling_Indoor"), Strings.getString("Cycling_Indoor")));
        addItem(new CustomLabelMenuItem("21.28," + Strings.getString("Cycling_eBiking"), Strings.getString("Cycling_eBiking")));
        addItem(new CustomLabelMenuItem("2.47," + Strings.getString("Cycling_eMTB"), Strings.getString("Cycling_eMTB")));
        addItem(new CustomLabelMenuItem("2.13," + Strings.getString("Cycling_Track"), Strings.getString("Cycling_Track")));
        addItem(new CustomLabelMenuItem("2.12," + Strings.getString("Cycling_Hand"), Strings.getString("Cycling_Hand")));
        addItem(new CustomLabelMenuItem("2.5," + Strings.getString("Cycling_Spin"), Strings.getString("Cycling_Spin")));
        addItem(new CustomLabelMenuItem("2.9," + Strings.getString("Cycling_Downhill"), Strings.getString("Cycling_Downhill")));
        addItem(new CustomLabelMenuItem("2.11," + Strings.getString("Cycling_Cyclocross"), Strings.getString("Cycling_Cyclocross")));
        addItem(new CustomLabelMenuItem("2.29," + Strings.getString("Cycling_BMX"), Strings.getString("Cycling_BMX")));
        addItem(new CustomLabelMenuItem("2.48," + Strings.getString("Cycling_Commuting"), Strings.getString("Cycling_Commuting")));
        addItem(new CustomLabelMenuItem("2.49," + Strings.getString("Cycling_Mixed"), Strings.getString("Cycling_Mixed")));
        addItem(new CustomLabelMenuItem("2.10," + Strings.getString("Cycling_Recumbent"), Strings.getString("Cycling_Recumbent")));
        addItem(new CustomLabelMenuItem("2.58," + Strings.getString("Cycling_Virtual"), Strings.getString("Cycling_Virtual")));
    }
}