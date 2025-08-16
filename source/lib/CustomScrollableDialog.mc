import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.System;

// Homemade number picker
public class CustomScrollableDialog extends WatchUi.View {

    private var string as String;
    private var position as Number;
    private var MAX as Number;
    private var readAll as Boolean;
    
    public function initialize() {
        View.initialize();

        position = 1;
        MAX = 0;
        string = "";
        readAll = false;
    }

    public function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);

        var foreground = Graphics.COLOR_WHITE;
        var background = Graphics.COLOR_BLACK;
        var width = dc.getWidth();
        var height = dc.getHeight();
        var isTouchScreen = System.getDeviceSettings().isTouchScreen;

        dc.setAntiAlias(true);
        
        dc.setColor(foreground, background);
        dc.clear();
        dc.setColor(foreground, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width/2, height/2 - position*Graphics.getFontHeight(Graphics.FONT_TINY), Graphics.FONT_TINY, string, Graphics.TEXT_JUSTIFY_CENTER);

        var triangleOffset = width/32f;
        
        if(position < MAX) {  // Show DOWN arrow
            var x = 0;
            var y = 0;
            if(isTouchScreen) {
                x = width/2;
                y = height*5/6;
                dc.setColor(background, background);
                dc.fillCircle(x, y, width/triangleOffset/2);
                dc.setColor(foreground, Graphics.COLOR_TRANSPARENT);
                dc.setPenWidth(2);
                dc.drawCircle(x, y, width/triangleOffset/2);
            } else {
                x = width*0.14;
                y = height*0.72;
            }
            
            var coordinates = [ [-triangleOffset + x, -(triangleOffset/2) + y], [triangleOffset + x, -(triangleOffset/2) + y], [0 + x, triangleOffset/2 + y] ];
            dc.fillPolygon(coordinates);
        }
        if(position > 1) {  // Show UP arrow
            var x = 0;
            var y = 0;
            if(isTouchScreen) {
                x = width/2;
                y = height/6;
                dc.setColor(background, background);
                dc.fillCircle(x, y, width/triangleOffset/2);
                dc.setColor(foreground, Graphics.COLOR_TRANSPARENT);
                dc.setPenWidth(2);
                dc.drawCircle(x, y, width/triangleOffset/2);
            } else {
                x = width*0.09;
                y = height*0.5;
            }
            
            var coordinates = [ [-triangleOffset + x, (triangleOffset/2) + y], [triangleOffset + x, (triangleOffset/2) + y], [0 + x, -(triangleOffset/2) + y] ];
            dc.fillPolygon(coordinates);
        }
        if(!readAll || isBottom()) {
            dc.setPenWidth(width/80);
            dc.drawArc(width/2, height/2, height/2*0.95, Graphics.ARC_COUNTER_CLOCKWISE, 23, 38);
        }
        

    }

    public function setString(mString as String, mMAX as Number) as Void {
        string = mString;
        MAX = mMAX;
    }

    public function setReadAll(mReadAll as Boolean) as Void {
        readAll = mReadAll;
    }

    public function setPosition(mPosition as Number) as Void {
        position = mPosition;
    }

    private function isBottom() as Boolean {
        return position == MAX;
    }
}


public class CustomScrollableDialogDelegate extends WatchUi.InputDelegate {

    public class RangeErrorException extends Lang.Exception {
        public function initialize() {
            Exception.initialize();
        }
    }
    
    private var view as CustomScrollableDialog;
    private var string as String;
    private var readAll as Boolean;
    private var position as Number;
    private var MAX as Number;
    
    public function initialize(mView as CustomScrollableDialog, mString as String, mReadAll as Boolean) {
        InputDelegate.initialize();

        view = mView;
        string = mString;
        readAll = mReadAll;
        if(readAll) {
            string = Strings.getString("ReadAll") + string;
        }
        position = 1;
        MAX = StringUtils.count(string, "\n") as Number;
        view.setReadAll(readAll);
        view.setString(string, MAX);
    }

    

    public function onKey(keyEvent) as Boolean {
        switch(keyEvent.getKey()) {
            case WatchUi.KEY_DOWN:
                onDown();
                break;
            case WatchUi.KEY_UP:
                onUp();
                break;
            case WatchUi.KEY_ENTER:
                onSimulatedConfirm();
                break;
            case WatchUi.KEY_ESC:
                onBack();
                break;
        }
        return true;
    }

    public function onTap(clickEvent) as Boolean {
        var coordinates = clickEvent.getCoordinates();
        var width = System.getDeviceSettings().screenWidth;
        var height = System.getDeviceSettings().screenHeight;
        var offset = width / 19;
        if( (coordinates[0] - width/2).abs() <= offset && (coordinates[1] - height/6).abs() <= offset ) {
            onUp();
        } else if( (coordinates[0] - width/2).abs() <= offset && (coordinates[1] - height*5/6).abs() <= offset ) {
            onDown();
        } else if( (coordinates[0] - width/2).abs() <= offset*3 && (coordinates[1] - height/2).abs() <= offset*3 ) {
            onSimulatedConfirm();
        }
        return true;
    }

    public function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Boolean {
        if(swipeEvent.getDirection() == WatchUi.SWIPE_RIGHT) {
            onBack();
        } else if(swipeEvent.getDirection() == WatchUi.SWIPE_UP) {
            onDown();
        } else if(swipeEvent.getDirection() == WatchUi.SWIPE_DOWN) {
            onUp();
        }
        return true;
    }

    public function onDown() as Void {
        if(position < MAX) {
            position++;
        }
        view.setPosition(position);
        WatchUi.requestUpdate();
        return;
    }

    public function onUp() as Void {
        if(position > 1) {
            position--;
        }
        view.setPosition(position);
        WatchUi.requestUpdate();
        return;
    }

    private function onSimulatedConfirm() as Boolean {
        if(!readAll) {
            onConfirm();
        } else if(isBottom()) {
            onConfirm();
        }
        return true;
    }

    private function isBottom() as Boolean {
        return position == MAX;
    }

    

    
    // This method must be overridden
    protected function onConfirm() as Void {
            
    }

    // This method may be overridden
    protected function onBack() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }
}