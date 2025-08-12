import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

public class ActivityClassMenu extends MenuBaseClass {
    
    public function initialize() {
        var title = WatchUi.loadResource(Rez.Strings.ActivityType);
        var itemHeight = (System.getDeviceSettings().screenHeight)*0.25;
        MenuBaseClass.initialize(title, itemHeight.toNumber(), {:theme => null, :dividerType => null});

        var name = Properties.getValue("CustomName");
        var sport = Properties.getValue("CustomSport");
        var subSport = Properties.getValue("CustomSubsport");
        var custom = name + ", " + sport + ", " + subSport;

        addItem(new CustomIconMenuItem(:running, WatchUi.loadResource(Rez.Strings.Running), "9 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Running)));
        addItem(new CustomIconMenuItem(:cycling, WatchUi.loadResource(Rez.Strings.Cycling), "17 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Cycling)));
        addItem(new CustomIconMenuItem(:fitness, WatchUi.loadResource(Rez.Strings.Fitness), "7 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Fitness)));
        addItem(new CustomIconMenuItem(:swimming, WatchUi.loadResource(Rez.Strings.Swimming), "3 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Swimming)));
        addItem(new CustomIconMenuItem(:field, WatchUi.loadResource(Rez.Strings.Field), "17 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Field)));
        addItem(new CustomIconMenuItem(:training, WatchUi.loadResource(Rez.Strings.Training), "10 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Training)));
        addItem(new CustomIconMenuItem(:walking, WatchUi.loadResource(Rez.Strings.Walking), "6 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Walking)));
        addItem(new CustomIconMenuItem(:winter, WatchUi.loadResource(Rez.Strings.WinterSports), "9 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Winter)));
        addItem(new CustomIconMenuItem(:water, WatchUi.loadResource(Rez.Strings.WaterSports), "15 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Water)));
        addItem(new CustomIconMenuItem(:flying, WatchUi.loadResource(Rez.Strings.Flying), "10 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Flying)));
        addItem(new CustomIconMenuItem(:motorsport, WatchUi.loadResource(Rez.Strings.Motorsports), "7 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Motorsports)));
        addItem(new CustomIconMenuItem(:climbing, WatchUi.loadResource(Rez.Strings.Climbing), "4 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Climbing)));
        addItem(new CustomIconMenuItem(:diving, WatchUi.loadResource(Rez.Strings.Diving), "6 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Diving)));
        addItem(new CustomIconMenuItem(:other, WatchUi.loadResource(Rez.Strings.Other), "17 " + WatchUi.loadResource(Rez.Strings.Presets), WatchUi.loadResource($.Rez.Drawables.Other)));
        addItem(new CustomIconMenuItem(:custom, WatchUi.loadResource(Rez.Strings.Custom), custom, WatchUi.loadResource($.Rez.Drawables.Custom)));
    }
}


public class ActivityClassMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        switch(item.getId()) {
            case :running:
                WatchUi.pushView(new RunningMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :cycling:
                WatchUi.pushView(new CyclingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :fitness:
                WatchUi.pushView(new FitnessMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :swimming:
                WatchUi.pushView(new SwimmingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :field:
                WatchUi.pushView(new FieldMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :training:
                WatchUi.pushView(new TrainingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :walking:
                WatchUi.pushView(new WalkingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :winter:
                WatchUi.pushView(new WinterMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :water:
                WatchUi.pushView(new WaterMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :flying:
                var view = new CustomScrollableDialog();
                var string = Strings.getInstance().getString("FlyingDialog");
                WatchUi.pushView(view, new FlyingDialogDelegate(view, string, true), WatchUi.SLIDE_LEFT);
                break;
            case :motorsport:
                WatchUi.pushView(new MotorsportMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :climbing:
                WatchUi.pushView(new ClimbingMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :diving:
                var view_1 = new CustomScrollableDialog();
                var string_1 = Strings.getInstance().getString("DivingDialog");
                WatchUi.pushView(view_1, new DivingDialogDelegate(view_1, string_1, true), WatchUi.SLIDE_LEFT);
                break;
            case :other:
                WatchUi.pushView(new OtherMenu(), new SetSportMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :custom:
                WatchUi.pushView(new CustomActivityMenu(), new CustomActivityMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
        }
        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}


public class SetSportMenuDelegate extends Menu2InputDelegate {
    
    public function initialize() {
        Menu2InputDelegate.initialize();
    }

    public function onSelect(item as MenuItem) as Void {
        var id = item.getId() as String;

        var index_dot = id.find(".");
        var index_comma = id.find(",");

        Properties.setValue("Sport", id.substring(0, index_dot).toNumber());
        Properties.setValue("SubSport", id.substring(index_dot + 1, index_comma).toNumber());
        Properties.setValue("Name", id.substring(index_comma + 1, id.length()));

        var sportData = SportData.getInstance();
        if(!sportData.isRecordingStarted()) {
            SportData.getInstance().create();
        }

        onBack();
        onBack();
        var menu = new MainMenu();
        menu = MenuUtils.setFocus(menu, :class);
        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }
}