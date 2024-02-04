import 'package:hive/hive.dart';

class AppLocal {
  static String imageKey = 'IMAGE';
  static String nameKey = 'NAME';
  static String isUploadKey = 'ISUPLOAD';

  //caching the user or imagePath or isUpload
  static cacheData(String key, value) {
    var box = Hive.box('user');
    box.put(key, value);
  }

  //
  static dynamic getCachedData(String key) {
    var box = Hive.box('user');
    return box.get(key);
  }

  // static cacheTask(String key, TaskModel value) {
  //   var box = Hive.box<TaskModel>('task');
  //   box.put(key, value);
  // }

  // static TaskModel getCachedTask(String key) {
  //   var box = Hive.box('task');
  //   return box.get(key);
  // }
}
