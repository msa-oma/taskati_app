import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/network/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/features/profile/upload_screen.dart';
import 'package:taskati_app/features/tasks/add_task_screen.dart';

String name = '';
String? imagePath;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    name = AppLocal.getCachedData(AppLocal.nameKey);
    imagePath = AppLocal.getCachedData(AppLocal.imageKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const UploadScreen();
                    },
                  ));
                },
                color: AppColors.primaryColor,
                icon: const Icon(
                  Icons.sunny,
                  size: 30,
                ))
          ],
          leading: IconButton(
            color: AppColors.primaryColor,
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.primaryColor,
                    foregroundImage: imagePath == null
                        ? const AssetImage('assets/user.png')
                        : FileImage(File(imagePath!)) as ImageProvider,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                        color: AppColors.primaryColor,
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt)))
              ],
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Divider(
                color: AppColors.primaryColor,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: getHeadlineStyle(fontsize: 24),
                ),
                const Spacer(),
                Container(
                  //we may need to add width and height
                  //I couldn't implements the some design as The Screenshot
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.primaryColor,
                        size: 30,
                      )),
                )

                //
              ],
            )
          ],
        )),
      ),
    );
  }
}
