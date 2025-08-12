import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

public class PageSettingView extends WatchUi.View {

    private var layout;
    private var pageNumber;
    private var datafields as Array<Datafield> = new Array<Datafield> [6] ;
    private var fieldsNumber;
    private var counter;
    private var position;
    private var editFieldsMode as Boolean;

    private var sportData;
    
    public function initialize(param_pageNumber, param_editFieldsMode as Boolean) {
        View.initialize();
        
        sportData = SportData.getInstance();
        pageNumber = param_pageNumber;
        editFieldsMode = param_editFieldsMode;

        position = 0;
        counter = 0;

        layout = new Layout(1);
    }

    public function setPosition(param_position) {
        counter = 0;
        position = param_position;
    }

    public function getPosition() {
        return position;
    }

    // Load your resources here
    public function onLayout(dc as Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();

        fieldsNumber = Properties.getValue("FieldsPage" + pageNumber.toString());
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
            var index = Properties.getValue(request);
            if(index == 31) {
                datafields[i] = new HeartRateDatafield(choice[i][0], choice[i][1], choice[i][2], choice[i][3], sportData.getMetric(index));
            }
            else {
                datafields[i] = new SimpleDatafield(choice[i][0], choice[i][1], choice[i][2], choice[i][3], sportData.getMetric(index));
            }
        }
    }   


    public function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
        dc.setAntiAlias(true);
        layout.draw(dc);
        
        for(var i = 0 ; i < fieldsNumber ; i += 1) {
            if(editFieldsMode && counter%5 <= 1 && i == position) {
                continue;
            }
            var request = "Field" + (i+1).toString() + "Page" + pageNumber.toString();
            var index = Properties.getValue(request);
            datafields[i].updateValue(sportData.getMetric(index));
            datafields[i].draw(dc);
        }
        counter += 1;
    }
}