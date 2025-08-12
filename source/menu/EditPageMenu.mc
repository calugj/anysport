import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

public class EditPageMenu extends MenuBaseClass {

    public function initialize(pageNumber) {
        var title = WatchUi.loadResource(Rez.Strings.EditPage).toString() + " " + pageNumber.toString();
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        var fieldsNumber = Properties.getValue("FieldsPage" + pageNumber.toString());
        var editNumber_substring;
        if(fieldsNumber <= 1) {
            editNumber_substring = fieldsNumber.toString() + " " + WatchUi.loadResource(Rez.Strings.Field);
        } else {
            editNumber_substring = fieldsNumber.toString() + " " + WatchUi.loadResource(Rez.Strings.Fields);
        }

        addItem(new CustomIconMenuItem(:editNumber, WatchUi.loadResource(Rez.Strings.EditFieldsNumber), editNumber_substring, WatchUi.loadResource($.Rez.Drawables.Custom)));
        addItem(new CustomIconMenuItem(:editFields, WatchUi.loadResource(Rez.Strings.EditFields), null, WatchUi.loadResource($.Rez.Drawables.Custom)));
        if(Properties.getValue("Pages") > 1) {
            addItem(new CustomIconMenuItem(:delete, WatchUi.loadResource(Rez.Strings.DeletePage), null, WatchUi.loadResource($.Rez.Drawables.Delete))); 
        }
    }
}


public class EditPageMenuDelegate extends Menu2InputDelegate {
    
    private var pageNumber;

    public function initialize(param_pageNumber as Number) {
        Menu2InputDelegate.initialize();

        pageNumber = param_pageNumber;
    }

    public function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        
        switch(id) {
           case :editNumber:
                var view = new CustomNumberPicker();
                WatchUi.pushView(view, new EditFieldsNumberPickerDelegate(view, Properties.getValue("FieldsPage" + pageNumber.toString()), 1, 6, pageNumber), WatchUi.SLIDE_LEFT);
                break;
            case :editFields:
                var view1 = new PageSettingView(pageNumber, true);
                WatchUi.pushView(view1, new FieldSettingViewDelegate(view1, pageNumber, 0), WatchUi.SLIDE_LEFT);
                break;
            case :delete:
                deletePage();
                WatchUi.popView(WatchUi.SLIDE_RIGHT);
                var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:page => pageNumber - 1,:wrap => true, :color => Properties.getValue("AccentColor") as Number});
                WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_RIGHT);
                WatchUi.requestUpdate();
                break;
        }

        WatchUi.requestUpdate();
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:page => pageNumber - 1,:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }

    private function deletePage()   {
        var pages = Properties.getValue("Pages");
        if(pages == 1) {
            return;
        }

        for(var index_page = pageNumber ; index_page < pages ; index_page++) {
            var value = 4;
            try {
                value = Properties.getValue("FieldsPage" + (index_page+1).toString());
            } catch(e) {}
            Properties.setValue("FieldsPage" + index_page.toString(), value);

            for(var index_field = 1 ; index_field <= 6 ; index_field++) {
                value = 0;
                try {
                    value = Properties.getValue("Field" + index_field.toString() + "Page" + (index_page+1).toString());
                } catch(e) {}
                Properties.setValue("Field" + index_field.toString() + "Page" + index_page.toString(), value);
            }
        }

        Properties.setValue("Pages", pages-1);
    }
}