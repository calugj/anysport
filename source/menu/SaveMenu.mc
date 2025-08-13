import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Application;

public class SaveMenu extends MenuBaseClass {
    
    private var counter as Number;
    private var offset as Number;

    public function initialize() {
        var title = "";
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        RefreshRate.getInstance().setRefreshRate(RefreshRate.REFRESH_HIGH);
        counter = 0;
        offset = 0;

        addItem(new CustomIconMenuItem(:save, Strings.getString("Save"), null, WatchUi.loadResource($.Rez.Drawables.Save)));
        addItem(new CustomIconMenuItem(:continue, Strings.getString("Continue"), null, WatchUi.loadResource($.Rez.Drawables.Play)));
        addItem(new CustomIconMenuItem(:delete, Strings.getString("Delete"), null, WatchUi.loadResource($.Rez.Drawables.Delete)));
    }

    public function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        var sportData = SportData.getInstance();
        var timer = (sportData.getMetric(0) as Array<String>)[0];
        var distance = (sportData.getMetric(5) as Array<String>)[0];

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(offset + dc.getWidth()/2, dc.getHeight()*0.6, Graphics.FONT_LARGE, timer, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(offset + dc.getWidth()*1.5, dc.getHeight()*0.6, Graphics.FONT_LARGE, distance, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        counter += 1;
        if(counter >= 80 && counter < 90) {
            offset -= dc.getWidth()/10;
        } else if(counter >= 170) {
            offset += dc.getWidth()/10;
        }
        if(counter == 180) {
            counter = 0;
            offset = 0;
        }
    }
}


public class SaveMenuDelegate extends Menu2InputDelegate {

    private var view as MainView;
    
    public function initialize(param_view as MainView) {
        Menu2InputDelegate.initialize();
        view = param_view;
    }

    public function onSelect(item as MenuItem) as Void {
        var sportData = SportData.getInstance() as SportData;

        switch(item.getId()) {
            case :save:
                var timer = sportData.getMetric(0);
                var distance = sportData.getMetric(5);
                sportData.save();
                WatchUi.pushView(new SummaryView(timer, distance), new SummaryViewDelegate(), WatchUi.SLIDE_LEFT);
                return;
            case :continue:
                onBack();
                sportData.start();
                view.showGreenRing = true;
                WatchUi.requestUpdate();
                return;
            case :delete:
                WatchUi.pushView(new DeleteMenu(), new DeleteMenuDelegate(), WatchUi.SLIDE_LEFT);
                return;
        }
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_BLINK);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}