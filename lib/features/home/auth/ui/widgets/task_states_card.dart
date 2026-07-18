




import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_color.dart';
import 'package:todo/core/theme/app_text_style.dart';

class TaskStatesCard extends StatelessWidget {
  const TaskStatesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Optional: use a RoundedRectangleBorder if you want to match the exact radius of your image
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0), 
      ),
      color: AppColor.primaryColor,
      child: Padding(
        // Generous vertical padding to match the design spacing
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            TaskStateItem(
              title: "Tasks",
              count: 12,
            ),
            TaskStateItem(
              title: "Done",
              count: 5,
            ),
            TaskStateItem(
              title: "Pending",
              count: 7,
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
        SizedBox(height: 8),
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