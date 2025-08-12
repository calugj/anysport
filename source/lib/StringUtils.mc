import Toybox.Lang;

public class StringUtils {
    public static function count(string as String, occurrence as String) {
        var counter = 0;
        var index = 1;
        while(string.find(occurrence) != null) {
            index = string.find(occurrence);
            string = string.substring(index + 1, string.length());
            counter++;
        }
        return counter;
    }
}