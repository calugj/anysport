import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class MainView extends WatchUi.View {

    private var sportData as SportData;

    private var layout as Layout;
    private var pageNumber as Number;
    private var datafields as Array<Datafield> = new Array<Datafield> [6] ;
    private var fieldsNumber as Number;
    public var ring as Ring;
    public var showGreenRing as Boolean;
    public var topBanner as TopBanner;

    public function initialize(param_pageNumber as Number) {
        View.initialize();

        sportData = SportData.getInstance() as SportData;
        pageNumber = param_pageNumber;
        
        layout = new Layout(1);
        fieldsNumber = 1;
        ring = new Ring();
        showGreenRing = false;
        topBanner = new TopBanner();
    }


    public function onLayout(dc as Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();

        fieldsNumber = Properties.getValue("FieldsPage" + pageNumber.toString()) as Number;
        layout.initialize(fieldsNumber);

        var choice = [null];
        switch (fieldsNumber) {
            case 1:
                choice = [[0, 0, width, height]];
                break;
            case 2:
                choice   = [[0, 0, width, height/2], [0, height/2, width, height/2]];
                break;
            case 3:
                choice = [[0, 0, width, height/3], [0, height/3, width, height/3], [0, 2*height/3, width, height/3]];
                break;
            case 4:
                choice = [[0, 0, width, height/3], [0, height/3, width/2, height/3], [width/2, height/3, width/2, height/3], [0, 2*height/3, width, height/3]];
                break;
            case 5:
                choice = [[0, 0, width, height/4], [0, height/4, width, height/4], [0, height/2, width/2, height/4], [width/2, height/2, width/2, height/4], [0, 3*height/4, width, height/4]];
                break;
            case 6:
                choice = [[0, 0, width, height/4], [0, height/4, width/2, height/4], [width/2, height/4, width/2, height/4], [0, height/2, width/2, height/4], [width/2, height/2, width/2, height/4], [0, 3*height/4, width, height/4]];
                break;
            default:
                choice = [[0, 0, width, height]];
        }

        for (var i = 0 ; i < fieldsNumber ; i += 1) {
            var request = "Field" + (i+1).toString() + "Page" + pageNumber.toString();
            var index = Properties.getValue(request) as Number;
            if(index == 31) {
                datafields[i] = new HeartRateDatafield(choice[i][0], choice[i][1], choice[i][2], choice[i][3], sportData.getMetric(index));
            }
            else {
                datafields[i] = new SimpleDatafield(choice[i][0], choice[i][1], choice[i][2], choice[i][3], sportData.getMetric(index));
            }
        }
    }


    public function onShow() as Void {
        if(showGreenRing) {
            ring.setStatus(2);
            showGreenRing = false;
        } else {
            ring.setStatus(0);
        }

        if(!sportData.isRecordingStarted()) {
            topBanner.setStatus(1);
        } else {
            topBanner.setStatus(0);
        }

        for (var i = 0 ; i < fieldsNumber ; i += 1) {
            datafields[i].doStuff();
        }
    }


    public function onUpdate(dc as Dc) as Void {
        if(sportData.setRing != 0) {
            ring.setStatus(sportData.setRing);
            sportData.setRing = 0;
        }
        
        View.onUpdate(dc);
        dc.setAntiAlias(true);

        var refreshRate = RefreshRate.getInstance() as RefreshRate;
        if(
            refreshRate.getRefresh() == RefreshRate.REFRESH_LOW &&
            (TopBanner.bannerAnimation || Ring.ringAnimation)
        ) {
            refreshRate.setRefreshRate(RefreshRate.REFRESH_HIGH);
        }
        else if(
            refreshRate.getRefresh() == RefreshRate.REFRESH_HIGH &&
            !(TopBanner.bannerAnimation || Ring.ringAnimation)
        ){
            refreshRate.setRefreshRate(RefreshRate.REFRESH_LOW);
        }

        layout.draw(dc);

        for(var i = 0 ; i < fieldsNumber ; i += 1) {
            var request = "Field" + (i+1).toString() + "Page" + pageNumber.toString();
            var index = Properties.getValue(request) as Number;
            datafields[i].updateValue(sportData.getMetric(index));
            datafields[i].draw(dc);
        }

        topBanner.draw(dc);
        ring.draw(dc); 
    }
}