import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/model/task_model.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_btn.dart';
import 'package:taskati_app/features/home/widgets/home_header.dart';
import 'package:taskati_app/features/tasks/add_task_screen.dart';

import 'widgets/task_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              const HomeHeader(),
              // today
              const Gap(20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Today',
                        style: Theme.of(context).textTheme.displayMedium,
                        //style: getTitleStyle(color: AppColors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 45,
                    width: 130,
                    child: CustomButton(
                      text: '+ Add Task',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddTaskScreen(),
                        ));
                      },
                    ),
                  )
                ],
              ),
              const Gap(20),
              //The Horizontal Date Picker Slider
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle().copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 24),
                monthTextStyle: const TextStyle().copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 10),
                dayTextStyle: const TextStyle().copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 10),
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    selectedDate = DateFormat.yMd().format(date);
                  });
                },
              ),

              // Tasks List
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<TaskModel>('task').listenable(),
                  builder: (context, Box<TaskModel> taskValue, child) {
                    List<TaskModel> tasks = [];
                    for (var element in taskValue.values) {
                      if (selectedDate == element.date) {
                        tasks.add(element);
                      }
                    }
                    return tasks.isNotEmpty
                        ? ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              TaskModel task = tasks[index];

                              return Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissDirection.startToEnd) {
                                      //complete
                                      taskValue.put(
                                          task.id,
                                          TaskModel(
                                              id: task.id,
                                              title: task.title,
                                              note: task.note,
                                              date: task.date,
                                              startTime: task.startTime,
                                              endTime: task.endTime,
                                              color: 3,
                                              isCompleted: true));
                                    } else {
                                      //delete "from DB"
                                      taskValue.delete(task.id);
                                    }
                                  },
                                  //delete task
                                  secondaryBackground: Container(
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.pinkishRed,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ' Delete ',
                                          style: getHeadlineStyle()
                                              .copyWith(color: AppColors.white),
                                        ),
                                        const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ],
                                    ),
                                  ),

                                  //task completed
                                  background: Container(
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.green.shade400,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ' Complete ',
                                          style: getHeadlineStyle()
                                              .copyWith(color: AppColors.white),
                                        ),
                                        const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: TaskCard(task: task));
                            },
                          )
                        : Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/empty.png'),
                                  const Gap(15),
                                  Text(
                                    'you don\'t have any task yet!',
                                    style: getHeadlineStyle(fontsize: 16),
                                  ),
                                  const Gap(10),
                                  Text(
                                    '   Add some   🚀',
                                    style: getHeadlineStyle(fontsize: 16),
                                  ),
                                  const Gap(25),
                                ]),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
