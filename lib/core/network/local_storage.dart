import 'package:hive/hive.dart';

class AppLocal {
  static String imageKey = 'IMAGE';
  static String nameKey = 'NAME';
  static String isUploadKey = 'ISUPLOAD';

  //
  static cacheData(String key, value) {
    var box = Hive.box('user');
    box.put(key, value);
  }

  //
  static dynamic getCachedData(String key) {
    var box = Hive.box('user');
    return box.get(key);
  }
}
