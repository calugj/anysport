import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Application;
import Toybox.Lang;

public class MainLoopFactory extends ViewLoopFactory {

    public function initialize() {
        ViewLoopFactory.initialize();
    }
    
    public function getSize() as Number {
        return Properties.getValue("Pages") as Number;
    }

    public function getView(page as Number) {
        var view = new MainView(page + 1);
        return [ view, new MainViewDelegate(view, page + 1) ];
    }
}


public class PageSettingLoopFactory extends ViewLoopFactory {

    public static const MAX_PAGES = 6;

    public function initialize() {
        ViewLoopFactory.initialize();
    }
    
    public function getSize() as Number {
        var pages = Properties.getValue("Pages") as Number;
        if(pages == MAX_PAGES) {
            return MAX_PAGES;
        }
        return pages + 1;
    }

    public function getView(page as Number) { 
        if(page + 1 <= Properties.getValue("Pages") as Number) {
            var view = new PageSettingView(page + 1, false);
            return [ view, new PageSettingViewDelegate(view, page + 1) ];
        }
        return[new AddPageView(), new AddPageViewDelegate()];  
    }
}