import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati_app/core/network/local_storage.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
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
              style: getTitleStyle(),
            ),
            Text(
              'Have A Nice Day',
              style: getBodyStyle(),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
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
