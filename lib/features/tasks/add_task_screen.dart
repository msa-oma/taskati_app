import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/model/task_model.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/my_custom_btn.dart';
import 'package:taskati_app/core/widgets/my_custom_tffild.dart';
import 'package:taskati_app/features/home/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String date = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  int _selectedColor = 0;
  // int colorIndex=1;

  var titleController = TextEditingController();
  var noteController = TextEditingController();

  late Box<TaskModel> taskBox;

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box('task');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Task',
          style: getHeadlineStyle(fontsize: 22),
        ),
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
              Text(
                'Title',
                style: getTitleStyle(),
              ),
              const Gap(3),
              CustomTextFormFild(
                controller: titleController,
                hintText: 'Enter title here',
              ),
              const Gap(10),

              //Note
              Text(
                'Note',
                style: getTitleStyle(),
              ),
              const Gap(3),
              CustomTextFormFild(
                controller: noteController,
                maxLines: 4,
                hintText: 'Enter note here',
              ),
              const Gap(10),
              //Date
              Text(
                'Date',
                style: getTitleStyle(),
              ),
              const Gap(5),
              CustomTextFormFild(
                readOnly: true,
                hintText: date,
                icon: IconButton(
                  onPressed: () {
                    showDateDialog();
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    //  color: AppColors.primaryColor,
                  ),
                ),
              ),
              const Gap(12),

              //Start and End time
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Start Time',
                    style: getTitleStyle(),
                  )),
                  const Gap(10),
                  Expanded(
                      child: Text(
                    'End Time',
                    style: getTitleStyle(),
                  )),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFild(
                      readOnly: true,
                      hintText: startTime,
                      icon: IconButton(
                        onPressed: () {
                          showStartTimeDialog();
                        },
                        icon: const Icon(
                          Icons.access_time,
                          // color: AppColors.ashGray,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: CustomTextFormFild(
                      readOnly: true,
                      hintText: endTime,
                      icon: IconButton(
                        onPressed: () {
                          showEndTimeDialog();
                        },
                        icon: const Icon(
                          Icons.access_time,
                          //   color: AppColors.ashGray,
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
                      backgroundColor: AppColors.warmOrange,
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
                      backgroundColor: AppColors.pinkishRed,
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
                      onPressed: () {
                        String id =
                            '${titleController.text}${DateTime.now().microsecond}';

                        taskBox.put(
                          id, //task key
                          TaskModel(
                              id: id,
                              title: titleController.text,
                              note: noteController.text,
                              date: date,
                              startTime: startTime,
                              endTime: endTime,
                              color: _selectedColor,
                              isCompleted: false),
                        );

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (contex) {
                          return const HomeScreen();
                        }));
                      },
                      width: 130,
                      hight: 45)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showDateDialog() async {
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      setState(() {
        date = DateFormat.yMd().format(pickedDate);
      });
    }
  }

  showStartTimeDialog() async {
    var starTimePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      // builder: (context, child) {
      //   return Theme(
      //     data: ThemeData(
      //          timePickerTheme: TimePickerThemeData(
      //              helpTextStyle: const TextStyle(color: AppColors.primaryColor),
      //              backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      //          colorScheme: ColorScheme.light(
      //            background: Theme.of(context).scaffoldBackgroundColor,
      //            primary: AppColors.primaryColor, // header background color
      //            secondary: Theme.of(context).primaryColor,
      //            onSecondary: Theme.of(context).primaryColor,
      //            onPrimary: Theme.of(context).primaryColor, // header text color
      //            onSurface: Theme.of(context).primaryColor, // body text color
      //            surface: Theme.of(context).primaryColor, // body text color
      //          ),
      //          textButtonTheme: TextButtonThemeData(
      //            style: TextButton.styleFrom(
      //              foregroundColor: AppColors.primaryColor, // button text color
      //            ),
      //          ),
      //         ),
      //     child: child!,
      //   );
      // },
    );

    if (starTimePicked != null) {
      setState(() {
        startTime = starTimePicked.format(context);
        int startMin = starTimePicked.minute;
        //The endTime is 15 minutes, more than the start time
        // in case no endTime is specified
        if ((startMin + 15) > 60) {
          int startHour = starTimePicked.hour;
          int rMin = startMin + 15 - 60;
          endTime = starTimePicked
              .replacing(hour: startHour + 1, minute: rMin)
              .format(context);
        } else {
          endTime =
              starTimePicked.replacing(minute: startMin + 15).format(context);
        }
      });
    }
  }

// u can determine specific endTime
  showEndTimeDialog() async {
    var endTimePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (endTimePicked != null) {
      setState(() {
        endTime = endTimePicked.format(context);
      });
    }
  }
}
