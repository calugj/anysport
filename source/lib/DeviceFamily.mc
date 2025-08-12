import Toybox.Lang;
import Toybox.System;

//  Reference: https://apps.garmin.com/api/appsLibraryExternalServices/api/asw/deviceTypes
public class DeviceFamily {

    public static enum {
        F6,
        F7,
        F8,
        FR70,
        VIVO,
    }

    private static const dictionary = {
        "fenix6xp" => "006-B3291-00",
            "fenix6xp-asia" => "006-B3516-00", 
        "fenix6sp" => "006-B3288-00",
            "fenix6sp-asia" => "006-B3513-00",
            "fenix6sp-asia-solar" => "006-B3765-00",
            "fenix6sp-jpn-solar" => "006-B3769-00",
        "fenix6p" => "006-B3290-00",
            "fenix6p-asia" => "006-B3515-00",
            "fenix6p-asia-solar" => "006-B3767-00",
            "fenix6p-jpn-solar" => "006-B3771-00",
        "forerunner945LTE" => "006-B3652-00",
            "forerunner945LTE-asia" => "006-B3978-00",
        "marq-adventurer" => "006-B3624-00",
            "marq-adventurer-asia" => "006-B3648-00",
        "marq-athlete" => "006-B3251-00",
            "marq-athlete-asia" => "006-B3451-00",
        "marq-aviator" => "006-B3247-00",
            "marq-aviator-asia" => "006-B3421-00",
        "marq-captain" => "006-B3248-00",
            "marq-captain-asia" => "006-B3448-00",
        "marq-commander" => "006-B3249-00",
            "marq-commander-asia" => "006-B3449-00",
        "marq-driver" => "006-B3246-00",
            "marq-driver-asia" => 	"006-B3420-00",
        "marq-expedition" => "006-B3250-00",
            "marq-expedition-asia" => "006-B3450-00",
        "marq-golfer" => "006-B3739-00",
        "marq-golfer-asia" => "006-B3850-00",

        // -------------------------------------

        "fenix7xpro" => "006-B4376-00",
        "fenix7Xpro-nwifi" => "006-B4596-00",
        "fenix7pro-nwifi" => "006-B4595-00",
        "fenix7spro" => "006-B4374-00",
        "fenix7pro" => "006-B4375-00",
        "fenix7X" => "006-B3907-00",
            "fenix7X-asia" => "006-B3910-00",
        "fenix7s" => "006-B3905-00",
            "fenix7s-asia" => "006-B3908-00",
        "fenix7" => "006-B3906-00",
            "fenix7-asia" => "006-B3909-00",
        "forerunner955" => "006-B4024-00",
        "forerunner255SM" => "006-B3991-00",
        "forerunner255S" => "006-B3993-00",
        "forerunner255" => "006-B3992-00",
        "forerunner255M" => "006-B3990-00",
        "marqII" => "006-B4105-00",
        "marqIIaviator" => "006-B4124-00",
        "marqII-apac" => "006-B4106-00",
        "marqII-commander-carbon" => "006-B4472-00",
        "epix2" => "006-B3943-00",
        "epix2-asia" => "006-B3944-00",
        "epixpro42" => "006-B4312-00",
        "epixpro47" => "006-B4313-00",
        "approachs70" => "006-B4234-00",
        "approachs70s" => 	"006-B4233-00",


        // -------------------------------------

        "fenix8-51mm" => "006-B4536-00",
        "fenix8s-51mm" => "006-B4533-00",
        "fenix8s-47mm" => "006-B4532-00",
        "fenix8-43mm" => "006-B4534-00",
        "enduro3" => "006-B4575-00",
        "fenixE" => "006-B4666-00",

        // -------------------------------------

        "FR970" => "006-B4565-00",
        "forerunner965" => "006-B4315-00",
        "FR570-47mm" => "006-B4570-00",
        "FR570-42mm" => "006-B4574-00",
        "forerunner265" => "006-B4257-00",
        "forerunner265s" => "006-B4258-00",
        "fr165" => "006-B4432-00",
        "fr165m" => "006-B4433-00",
        "epixpro51" => "006-B4314-00",
        
        // -------------------------------------
        
        "vva6" => "006-B4625-00",
        "vivoactive5" => "006-B4426-00",
        "venux1" => "006-B4603-00",
        "venu3" => "006-B4260-00",
        "venu3s" => "006-B4261-00",
        "venu2" => "006-B3703-00",
            "venu2-asia" => "006-B3950-00",
        "venu2s" => "006-B3704-00",
            "venu2s-asia" => "006-B3949-00",
        "venu2plus" => "006-B3851-00",
            "venu2plus-asia" => "006-B4017-00",
        "venusq2" => "006-B4115-00",
        "venusq2music" => "006-B4116-00",
        


    };

    // Fenix6 family
    public static function f6() {
        return [
            "fenix6xp",
            "fenix6sp",
            "fenix6p",
            "fenix6xp-asia",
            "fenix6sp-asia",
            "fenix6sp-asia-solar",
            "fenix6sp-jpn-solar",
            "fenix6p-asia", 
            "fenix6p-asia-solar",
            "fenix6p-jpn-solar",
            "forerunner945LTE",
           	"forerunner945LTE-asia",
            "marq-adventurer",
            "marq-adventurer-asia",
            "marq-athlete",
            "marq-athlete-asia",
            "marq-aviator",
            "marq-aviator-asia",
            "marq-captain",
            "marq-captain-asia",
            "marq-commander",
            "marq-commander-asia",
            "marq-driver",
            "marq-driver-asia",
            "marq-expedition",
            "marq-expedition-asia",
            "marq-golfer",
            "marq-golfer-asia",

        ];
    }

    // Fenix7 family
    public static function f7() {
        return [
            "fenix7xpro",
            "fenix7Xpro-nwifi",
            "fenix7pro-nwifi",
            "fenix7X",
            "fenix7s",
            "fenix7spro",
            "fenix7pro",
            "fenix7",
            "fenix7X-asia",
            "fenix7s-asia",
            "fenix7-asia",
            "forerunner955",
            "forerunner255S",
            "forerunner255SM",
            "forerunner255",
            "forerunner255M",
            "marqII",
            "marqIIaviator",
            "marqII-apac",
            "marqII-commander-carbon",
            "epix2",
            "epix2-asia",
            "epixpro42",
            "epixpro47",
            "approachs70",
            "approachs70s",

        ];
    }

    // Fenix8 family
    public static function f8() {
        return [
            "fenix8-51mm",
            "fenix8s-51mm",
            "fenix8s-47mm",
            "fenix8-43mm",
            "enduro3",
            "fenixE",
            
            

        ];
    }

    // Fr70 family
    public static function fr70() {
        return [
            "FR970",
            "forerunner965",
            "FR570-47mm",
            "FR570-42mm",
            "forerunner265",
            "forerunner265s",
            "fr165",
            "fr165m",
            "epixpro51",

        ];
    }

    // Vivo family
    public static function vivo() {
        return [
            "vva6",
            "vivoactive5",
            "venux1",
            "venu3",
            "venu3s",
            "venu2",
            "venu2s",
            "venu2plus",
            "venu2-asia",
            "venu2s-asia",
            "venu2plus-asia",
            "venusq2",
            "venusq2music",
            

        ];
    }




    public static function getFamily() {
        var device = System.getDeviceSettings().partNumber;

        var array = f6() as Array<String>;
        for(var i = 0 ; i < array.size() ; i++) {
            if(device.equals(dictionary.get(array[i]))) {
                return F6;
            }
        }

        array = f7() as Array<String>;
        for(var i = 0 ; i < array.size() ; i++) {
            if(device.equals(dictionary.get(array[i]))) {
                return F7;
            }
        }

        array = f8() as Array<String>;
        for(var i = 0 ; i < array.size() ; i++) {
            if(device.equals(dictionary.get(array[i]))) {
                return F8;
            }
        }

        array = fr70() as Array<String>;
        for(var i = 0 ; i < array.size() ; i++) {
            if(device.equals(dictionary.get(array[i]))) {
                return FR70;
            }
        }

        array = vivo() as Array<String>;
        for(var i = 0 ; i < array.size() ; i++) {
            if(device.equals(dictionary.get(array[i]))) {
                return VIVO;
            }
        }

        return F6;
    }
}