import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/widgets/my_custom_btn.dart';
import 'package:taskati_app/core/widgets/my_custom_tffild.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Task',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.primaryColor),
        ),
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              // Title
              const Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Gap(3),
              const CustomTextFormFild(
                hintText: 'Enter title here',
              ),
              const Gap(10),

              //Note
              const Text(
                'Note',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Gap(3),
              const CustomTextFormFild(
                hintText: 'Enter note here',
              ),
              const Gap(10),

              //Date
              const Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Gap(5),
              CustomTextFormFild(
                hintText: '10/30/2023',
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.date_range,
                    color: AppColors.ashGray,
                  ),
                ),
              ),
              const Gap(12),

              //Start and End time
              const Row(
                children: [
                  Expanded(
                      child: Text(
                    'Start Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                  Expanded(
                      child: Text(
                    'End Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFild(
                      readOnly: true,
                      hintText: '02:30 AM',
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time,
                          color: AppColors.ashGray,
                        ),
                      ),
                    ),
                  ),
                  const Gap(6),
                  Expanded(
                    child: CustomTextFormFild(
                      readOnly: true,
                      hintText: '02:45 AM',
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time,
                          color: AppColors.ashGray,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const Gap(
                20,
              ),

              //Selected Color
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = 0;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 20,
                      child: (_selectedColor == 0)
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const Gap(5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = 1;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.orange,
                      radius: 20,
                      child: (_selectedColor == 1)
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const Gap(5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = 2;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.pink,
                      radius: 20,
                      child: (_selectedColor == 2)
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ), //

                  const Spacer(),
                  MyElevatedButton(
                      text: 'Ceate Task',
                      onPressed: () {},
                      width: 130,
                      hight: 45)
                ],
              ) //
            ],
          ),
        ),
      ),
    );
  }
}
