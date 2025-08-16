import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.Position;

public class TopBanner {
    
    // 0 = hidden, 1 = lowering, 2 = showing, 3 = lifting
    var status as Number;
    var counter as Number;

    public static var bannerAnimation as Boolean;
    private static const FRAMES = 30;
    private static const FRAMES_ANIM = 6;

    private static const SLIDER_ANIM = 30;
    private var sliderCounter as Number;
    private var beep as Boolean;

    public function initialize() {
        status = 0;
        counter = 0;
        bannerAnimation = false;
        sliderCounter = 0;
        beep = false;

        if(Position.getInfo().accuracy >= Position.QUALITY_USABLE) {
            sliderCounter = SLIDER_ANIM;
            beep = true;
        }
    }
    

    public function setStatus(param_status as Number) as Void {
        if(status == 0 && param_status == 3) {
            return;
        }
        
        status = param_status;
        if(status >= 4) {status = 0;}
        
        if(status == 1 || status == 3) {
            TopBanner.bannerAnimation = true;
        }
        else if(status == 0) {
            counter = 0;
            TopBanner.bannerAnimation = false;
        }
        else if(status == 2) {
            counter = FRAMES;
            TopBanner.bannerAnimation = false;
        }
    }


    public function draw(dc as Dc) as Void {
        if(status == 0) {
            return;
        }
        
        var width = dc.getWidth();
        var height = dc.getHeight();

        var backgroundColor = Properties.getValue("BackgroundColor") as Number;
        var foregroundColor;
        var red;
        var green;
        if(backgroundColor == Graphics.COLOR_WHITE) {
            foregroundColor = Graphics.COLOR_WHITE;
            backgroundColor = Graphics.COLOR_BLACK;
            red = Graphics.COLOR_RED;
            green = Graphics.COLOR_GREEN;
        } else {
            foregroundColor = Graphics.COLOR_BLACK;
            backgroundColor = Graphics.COLOR_WHITE;
            red = Graphics.COLOR_DK_RED;
            green = Graphics.COLOR_DK_GREEN;
        }

        var bannerHeight = width*0.2;
        var step = bannerHeight / FRAMES_ANIM;
        var y = - bannerHeight + step*(counter - FRAMES + FRAMES_ANIM );

        // Draw banner  -----
        if(counter > FRAMES - FRAMES_ANIM) {
            var accuracy = Position.getInfo().accuracy;

            dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);
            dc.fillRectangle(0, y, width, bannerHeight);
            dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
            dc.setPenWidth(width*0.01);
            dc.drawLine(0, y + bannerHeight, width, y + bannerHeight);
            
            dc.setPenWidth(width*0.01);
            dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
            dc.drawArc(width/2, y + height/2, height*0.47, Graphics.ARC_CLOCKWISE, 130, 50);
            dc.setColor(red, Graphics.COLOR_TRANSPARENT);
            dc.setPenWidth(width*0.02);
            

            if(Properties.getValue("Satellites") as Number == 0) {
                dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
                dc.drawText(width/2, y + bannerHeight*0.65, Graphics.FONT_XTINY, Strings.getString("PressStart"), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            } else {
                if(accuracy <= Position.QUALITY_LAST_KNOWN) {
                    sliderCounter = 0;
                    beep = false;

                    dc.drawArc(width/2, y + height/2, height*0.47, Graphics.ARC_CLOCKWISE, 130, 127);
                    dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);
                    dc.drawArc(width/2, y + height/2, height*0.47, Graphics.ARC_CLOCKWISE, 127, 126);
                } else if(accuracy <= Position.QUALITY_POOR) {
                    beep = false;
                    if(sliderCounter == SLIDER_ANIM) {
                        sliderCounter = SLIDER_ANIM/2;
                    }

                    dc.drawArc(width/2, y + height/2, height*0.47, Graphics.ARC_CLOCKWISE, 130, 127 - (sliderCounter * 77/SLIDER_ANIM));
                    dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);
                    dc.drawArc(width/2, y + height/2, height*0.47, Graphics.ARC_CLOCKWISE, 127 - (sliderCounter * 77/SLIDER_ANIM), 127 - (sliderCounter * 77/SLIDER_ANIM) - 1);

                    if(sliderCounter < SLIDER_ANIM/2) {
                        sliderCounter += 1;
                    }
                } else {
                    if(sliderCounter == SLIDER_ANIM) {
                        if(!beep) {
                            if(System.getDeviceSettings().vibrateOn) {
                                Attention.vibrate([new Attention.VibeProfile(50, 100)]);
                            }
                            if(Attention has :playTone && System.getDeviceSettings().tonesOn) {
                                Attention.playTone(Attention.TONE_MSG);
                            }
                            beep = true;
                        }

                        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
                        dc.drawText(width/2, y + bannerHeight*0.65, Graphics.FONT_XTINY, Strings.getString("PressStart"), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

                        dc.setColor(green, Graphics.COLOR_TRANSPARENT);
                    }
                    
                    dc.drawArc(width/2, y + height/2, height*0.47, Graphics.ARC_CLOCKWISE, 130, 127 - (sliderCounter * 77/SLIDER_ANIM));
                    dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);
                    dc.drawArc(width/2, y + height/2, height*0.47, Graphics.ARC_CLOCKWISE, 127 - (sliderCounter * 77/SLIDER_ANIM), 127 - (sliderCounter * 77/SLIDER_ANIM) - 1);

                    if(sliderCounter < SLIDER_ANIM) {
                        sliderCounter += 1;
                    }
                }
            }
        }

        // ------------------

        if(status == 1) {counter += 1;}
        if(status == 3) {counter -= 1;}

        if(counter == FRAMES + 1 || counter == 0) {
            setStatus(status + 1);
        }
    }
}