import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

public class FieldSettingViewDelegate extends WatchUi.BehaviorDelegate {
    
    private var view as PageSettingView;
    private var pageNumber as Number;
    private var position as Number;
    private var FIELDS as Number;

    public function initialize(param_view as PageSettingView, param_pageNumber as Number, param_position as Number) {
        BehaviorDelegate.initialize();

        view = param_view;
        pageNumber = param_pageNumber;
        position = param_position;
        FIELDS = Properties.getValue("FieldsPage" + pageNumber.toString()) as Number;
    }

    public function onMenu() as Boolean {
        return true;
    }

    public function onSimulatedSelect() as Boolean {
        var menu = new FieldSettingMenu();
        menu = MenuUtils.setFocus(menu as FieldSettingMenu, Properties.getValue("Field" + (position + 1).toString() + "Page" + pageNumber) as Number);
        WatchUi.pushView(menu as FieldSettingMenu, new FieldSettingMenuDelegate(pageNumber, position + 1), WatchUi.SLIDE_LEFT);
        return true;
    }

    public function onBack() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);

        return true;
    }


    public function onNextPage() as Boolean {
        if(position < FIELDS - 1) {
            position += 1;
            view.setPosition(position);
            WatchUi.requestUpdate();
        }
        return true;
    }

    public function onPreviousPage() as Boolean {
        if(position > 0) {
            position -= 1;
            view.setPosition(position);
            WatchUi.requestUpdate();
        }
        return true;
    }


    public function onKey(keyEvent) {
        switch(keyEvent.getKey()) {
            case WatchUi.KEY_ENTER:
                onSimulatedSelect();
                return true;
        }
        return false;
    }

    public function onTap(clickEvent) as Boolean {
        var coordinates = clickEvent.getCoordinates();
        var width = System.getDeviceSettings().screenWidth;
        var height = System.getDeviceSettings().screenHeight;

        var chosenBox = 1;
        
        switch (FIELDS) {
            case 1:
                chosenBox = 1;
                break;
            case 2: 
                if(coordinates[1] <= height/2) {chosenBox = 0;}
                else {chosenBox = 1;}
                break;
            case 3:
                if(coordinates[1] <= height/3) {chosenBox = 0;}
                else if(coordinates[1] <= height*2/3) {chosenBox = 1;}
                else {chosenBox = 2;}
                break;
            case 4:
                if(coordinates[1] <= height/3) {chosenBox = 0;}
                else if(coordinates[0] <= width/2 && coordinates[1] <= height*2/3) {chosenBox = 1;}
                else if(coordinates[1] < height*2/3) {chosenBox = 2;}
                else {chosenBox = 3;}
                break;
            case 5:
                if(coordinates[1] <= height/4) {chosenBox = 0;}
                else if(coordinates[1] <= height/2) {chosenBox = 1;}
                else if(coordinates[0] <= width/2 && coordinates[1] <= height*3/4) {chosenBox = 2;}
                else if(coordinates[1] < height*3/4) {chosenBox = 3;}
                else {chosenBox = 4;}
                break;
            case 6:
                if(coordinates[1] <= height/4) {chosenBox = 0;}
                else if(coordinates[0] <= width/2 && coordinates[1] <= height/2) {chosenBox = 1;}
                else if(coordinates[1] <= height/2) {chosenBox = 2;}
                else if(coordinates[0] <= width/2 && coordinates[1] <= height*3/4) {chosenBox = 3;}
                else if(coordinates[1] < height*3/4) {chosenBox = 4;}
                else {chosenBox = 5;}
                break;
        }

        if(chosenBox != view.getPosition()) {
            position = chosenBox;
            view.setPosition(position);
        } else {
            onSimulatedSelect();
        }
        
        return true;
    }
}