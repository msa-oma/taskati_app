import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app/core/model/task_model.dart';
import 'package:taskati_app/core/utils/themes.dart';
import 'package:taskati_app/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  //Creating a Hive box
  await Hive.openBox('user');
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');

  await Hive.openBox<bool>('mode'); //dark light mode

  runApp(const TaskatiApp());
}

class TaskatiApp extends StatelessWidget {
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>('mode').listenable(),
      builder: (context, value, child) {
        bool darkMode = value.get('darkMode', defaultValue: false)!;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: darkTheme,
          theme: lightTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
