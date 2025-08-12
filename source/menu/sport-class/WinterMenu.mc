import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

public class WinterMenu extends MenuBaseClass {

    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.WinterSports);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.15;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        addItem(new CustomLabelMenuItem("58.0," + WatchUi.loadResource(Rez.Strings.Winter_Generic), WatchUi.loadResource(Rez.Strings.Winter_Generic)));
        addItem(new CustomLabelMenuItem("12.0," + WatchUi.loadResource(Rez.Strings.Winter_CrossCountryClassic), WatchUi.loadResource(Rez.Strings.Winter_CrossCountryClassic)));
        addItem(new CustomLabelMenuItem("12.42," + WatchUi.loadResource(Rez.Strings.Winter_CrossCountrySkate), WatchUi.loadResource(Rez.Strings.Winter_CrossCountrySkate)));
        addItem(new CustomLabelMenuItem("13.0," + WatchUi.loadResource(Rez.Strings.Winter_AlpineSki), WatchUi.loadResource(Rez.Strings.Winter_AlpineSki)));
        addItem(new CustomLabelMenuItem("14.0," + WatchUi.loadResource(Rez.Strings.Winter_Snowboard), WatchUi.loadResource(Rez.Strings.Winter_Snowboard)));
        addItem(new CustomLabelMenuItem("13.37," + WatchUi.loadResource(Rez.Strings.Winter_BackCountrySki), WatchUi.loadResource(Rez.Strings.Winter_BackCountrySki)));
        addItem(new CustomLabelMenuItem("14.37," + WatchUi.loadResource(Rez.Strings.Winter_BackCountrySnowboard), WatchUi.loadResource(Rez.Strings.Winter_BackCountrySnowboard)));
        addItem(new CustomLabelMenuItem("33.0," + WatchUi.loadResource(Rez.Strings.Winter_IceSkate), WatchUi.loadResource(Rez.Strings.Winter_IceSkate)));
        addItem(new CustomLabelMenuItem("35.0," + WatchUi.loadResource(Rez.Strings.Winter_Snowshoe), WatchUi.loadResource(Rez.Strings.Winter_Snowshoe)));
    }
}