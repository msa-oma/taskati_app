import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/network/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_error_dialog.dart';
import 'package:taskati_app/core/widgets/my_custom_btn.dart';
import 'package:taskati_app/features/home/home_screen.dart';

import 'Widgets/show_dialogs.dart';

//String? imagePath;
String? _imagePath;
String name = '';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0, actions: [
        TextButton(
          child: Text(
            'Done',
            style: getHeadlineStyle(),
          ),
          onPressed: () {
            if (_imagePath != null && name.isNotEmpty) {
              AppLocal.cacheData(AppLocal.imageKey, _imagePath);
              AppLocal.cacheData(AppLocal.nameKey, name);
              AppLocal.cacheData(AppLocal.isUploadKey, true);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            } else if (_imagePath == null && name.isNotEmpty) {
              showErrorDialog(context, 'Please Upload Your image');
            } else if (_imagePath != null && name.isEmpty) {
              showErrorDialog(context, 'Enter Your Name');
            } else {
              showErrorDialog(
                  context, 'Please Upload an image and Enter Your Name');
            }
          },
        ),
      ]),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(150),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.primaryColor,
                  foregroundImage: (_imagePath != null)
                      ? FileImage(File(_imagePath!)) as ImageProvider
                      : const AssetImage(
                          'assets/user.png',
                        ),
                ),
                const Gap(20),
                MyElevatedButton(
                  text: ' upload from camera ',
                  width: 200,
                  hight: 42,
                  // onPressed: () {
                  //   uploadImageFromCamera();
                  // },
                  onPressed: () async {
                    var imagePath = await uploadImageFromCamera();
                    _imagePath = imagePath;
                    setState(() {});
                  },
                ),
                const Gap(10),
                MyElevatedButton(
                    text: 'upload from Gallery',
                    // onPressed: () {
                    //   uploadImageFromGallery();
                    // },
                    onPressed: () async {
                      var imagePath = await uploadImageFromGallery();
                      _imagePath = imagePath;
                      setState(() {});
                    },
                    width: 200,
                    hight: 42),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    labelStyle: TextStyle(fontSize: 22),
                    hintText: 'Enter your Name',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
