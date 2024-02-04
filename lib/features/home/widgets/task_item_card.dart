import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/model/task_model.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final TaskModel task;

  Color getColor(index) {
    //index 0 =>Color is primaryColor,
    //index 1 =>Color is warmOrange,
    //index 2 =>Color is pinkishRed,
    //green 'completed',
    if (index == 0) {
      return AppColors.primaryColor;
    } else if (index == 1) {
      return AppColors.warmOrange;
    } else if (index == 2) {
      return AppColors.pinkishRed;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: getColor(task.color), borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: getBodyStyle(color: AppColors.white),
              ),
              const Gap(5),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.white,
                  ),
                  const Gap(10),
                  Text(
                    '${task.startTime} - ${task.endTime}',
                    style: getSmallTextStyle(color: AppColors.white),
                  )
                ],
              ),
              const Gap(5),
              SizedBox(
                width: 280,
                child: Text(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  task.note,
                  style: getBodyStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: .6,
            height: 60,
            color: AppColors.white,
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              (task.isCompleted) ? 'COMPLETE' : 'TODO',
              style: getTitleStyle(color: AppColors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
