import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/features/profile/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const UploadScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/logo.json',
              height: 250,
            ),
            const Gap(15),
            Text(
              'Taskati',
              style: getTitleStyle(fontSize: 22, color: AppColors.primaryColor),
            ),
            const Gap(20),
            Text(
              'it\'s time to Get Organized',
              style: getSmallTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
