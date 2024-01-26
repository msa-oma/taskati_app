import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/widgets/my_custom_btn.dart';
import 'package:taskati_app/features/profile/profile_screen.dart';

// ignore: non_constant_identifier_names
String? _Image;

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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const ProfileScreen();
              },
            ));
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
                  foregroundImage: (_Image != null)
                      ? FileImage(File(_Image!)) as ImageProvider
                      : const AssetImage(
                          'assets/user.png',
                        ),
                ),
                const Gap(20),
                MyElevatedButton(
                  text: ' upload from camera ',
                  width: 200,
                  hight: 42,
                  onPressed: () {
                    getImageFromGallery();
                  },
                ),
                const Gap(10),
                MyElevatedButton(
                    text: 'upload from Gallery',
                    onPressed: () {
                      getImageFromGallery();
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
                  decoration: const InputDecoration(
                    label: Text('Name'),
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

  getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }

  getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }
}
