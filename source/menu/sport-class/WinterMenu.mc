import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class WinterMenu extends MenuBaseClass {

    public function initialize() {
        var title = Strings.getString("WinterSports");
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("58.0," + Strings.getString("Winter_Generic"), Strings.getString("Winter_Generic")));
        addItem(new CustomLabelMenuItem("12.0," + Strings.getString("Winter_CrossCountryClassic"), Strings.getString("Winter_CrossCountryClassic")));
        addItem(new CustomLabelMenuItem("12.42," + Strings.getString("Winter_CrossCountrySkate"), Strings.getString("Winter_CrossCountrySkate")));
        addItem(new CustomLabelMenuItem("13.0," + Strings.getString("Winter_AlpineSki"), Strings.getString("Winter_AlpineSki")));
        addItem(new CustomLabelMenuItem("14.0," + Strings.getString("Winter_Snowboard"), Strings.getString("Winter_Snowboard")));
        addItem(new CustomLabelMenuItem("13.37," + Strings.getString("Winter_BackCountrySki"), Strings.getString("Winter_BackCountrySki")));
        addItem(new CustomLabelMenuItem("14.37," + Strings.getString("Winter_BackCountrySnowboard"), Strings.getString("Winter_BackCountrySnowboard")));
        addItem(new CustomLabelMenuItem("33.0," + Strings.getString("Winter_IceSkate"), Strings.getString("Winter_IceSkate")));
        addItem(new CustomLabelMenuItem("35.0," + Strings.getString("Winter_Snowshoe"), Strings.getString("Winter_Snowshoe")));
    }
}