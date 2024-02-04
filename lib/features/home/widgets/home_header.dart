import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati_app/core/network/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/features/profile/profile_screen.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? name;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = AppLocal.getCachedData(AppLocal.imageKey);
    name = AppLocal.getCachedData(AppLocal.nameKey);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.primaryColor),
            ),
            Text(
              ' Have A Nice Day',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ));
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: imagePath != null
                ? FileImage(File(imagePath!)) as ImageProvider
                : const AssetImage('assets/user.png'),
          ),
        )
      ],
    );
  }
}
