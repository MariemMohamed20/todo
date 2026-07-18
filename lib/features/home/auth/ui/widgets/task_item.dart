


import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            SizedBox(width: 20,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text("Flutter Ui",style: AppTextStyle.headlineStyle),
                Text("Flutter Ui",style: AppTextStyle.bodyMediumStyle.copyWith(
                  color: Colors.grey,
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,
                  vertical: 7
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue.shade100
                  ),
                  child: Text("Pending",style: AppTextStyle.bodyMediumStyle.copyWith(
                    color: Colors.blue,
                  )),
                )
              ],
            )),
            Icon(Icons.arrow_forward_ios,size: 30,)
          ],
        ),
      ),
    );
  }
}