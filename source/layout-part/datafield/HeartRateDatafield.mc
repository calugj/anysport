import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.UserProfile;
import Toybox.Lang;
import Toybox.Application;

public class HeartRateDatafield extends Datafield {

    private var zones as Array<Number>? = null;
    
    public function initialize(param_x as Number, param_y as Number, param_width as Number, param_height as Number, param_value as Array<String>) {
        Datafield.initialize(param_x, param_y, param_width, param_height, param_value);
    }

    public function doStuff() as Void {
        Datafield.doStuff();

        var sport = Properties.getValue("Sport") as Number;
        var sportClass;
        switch(sport) {
            case 1:
                sportClass = UserProfile.HR_ZONE_SPORT_RUNNING;
                break;
            case 2:
                sportClass = UserProfile.HR_ZONE_SPORT_BIKING;
                break;
            case 5:
                sportClass = UserProfile.HR_ZONE_SPORT_SWIMMING;
                break;
            default:
                sportClass = UserProfile.HR_ZONE_SPORT_GENERIC;
                break;
        }
        zones = UserProfile.getHeartRateZones(sportClass);
    }
    
    public function draw(dc as Dc) as Void {
        Datafield.draw(dc);
        
        var hr = value[0].toNumber();
        var color;
        if(hr == null || zones == null || hr < zones[0]) {color = Graphics.COLOR_LT_GRAY;}
        else if(hr < zones[1]) {color = Graphics.COLOR_DK_GRAY;}
        else if(hr < zones[2]) {color = Graphics.COLOR_BLUE;}
        else if(hr < zones[3]) {color = Graphics.COLOR_GREEN;}
        else if(hr < zones[4]) {color = Graphics.COLOR_ORANGE;}
        else {color = Graphics.COLOR_RED;}

        var font;
        var offset0;
        var offset1;

        if(height == dc.getHeight()) {
            font = Graphics.FONT_NUMBER_HOT;
            offset0 = 0.55;
            offset1 = 0.27;
        }
        else if(height < dc.getHeight() && width == dc.getWidth()) {
            font = Graphics.FONT_NUMBER_MILD;
            offset0 = 0.55;
            offset1 = 0.36;
        }
        else {
            font = Graphics.FONT_LARGE;
            offset0 = 0.6;
            offset1 = 0.28;
        }
        
        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x + width*offset0, y + height*0.6, font, value[0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.fillCircle(x + width*offset1, y + height*0.6, dc.getWidth()*0.03);
    }
}