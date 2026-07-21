import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_color.dart';
import 'package:todo/core/theme/app_text_style.dart';

class TaskStatesCard extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;

  const TaskStatesCard({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      color: AppColor.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TaskStateItem(
              title: "Tasks",
              count: totalTasks,
            ),
            TaskStateItem(
              title: "Done",
              count: completedTasks,
            ),
            TaskStateItem(
              title: "Pending",
              count: pendingTasks,
            ),
          ],
        ),
      ),
    );
  }
}
class TaskStateItem extends StatelessWidget {
  final String title;
  final int count;

  const TaskStateItem({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count.toString(),
          style: AppTextStyle.headlineStyle.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyle.bodySmallStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}