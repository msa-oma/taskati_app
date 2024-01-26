import 'package:flutter/material.dart';
import 'package:taskati_app/splash_screen.dart';

void main() {
  runApp(const TaskatiApp());
}

class TaskatiApp extends StatelessWidget {
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
