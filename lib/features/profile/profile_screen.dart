import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:taskati_app/core/network/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/features/home/home_screen.dart';
import 'package:taskati_app/features/profile/Widgets/show_dialogs.dart';

String name = '';
String? imagePath;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Box<bool> modeBox;
  @override
  void initState() {
    super.initState();

    name = AppLocal.getCachedData(AppLocal.nameKey);

    imagePath = AppLocal.getCachedData(AppLocal.imageKey);

    modeBox = Hive.box('mode');
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = modeBox.get('darkMode') ?? false;
    return Scaffold(
      appBar: AppBar(
          actions: [
            // Switch(
            //   value: isDark,
            //   onChanged: (val) {
            //     setState(() {
            //       modeBox.put("darkMode", isDark);
            //     });
            //   },
            // ),
            IconButton(
                onPressed: () {
                  setState(() {
                    modeBox.put('darkMode', !isDark);
                  });
                },
                icon: Icon(
                  isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                  size: 30,
                ))
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
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
                        onPressed: () {
                          showImageDialog(context, onTapCamera: () async {
                            await uploadImageFromCamera().then((value) {
                              // setState(() {});

                              Navigator.of(context).pop();

                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ));
                            });
                          }, onTapGallery: () async {
                            await uploadImageFromGallery().then((value) {
                              // setState(() {});
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ));
                            });
                          });
                        },
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
                  //I couldn't implements the same design as The Screenshot
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),

                  child: IconButton(
                      onPressed: () {
                        showNameDialog(context, name);
                        setState(() {});
                      },
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
