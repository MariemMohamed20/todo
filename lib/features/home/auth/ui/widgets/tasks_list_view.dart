


import 'package:flutter/material.dart';
import 'package:todo/features/home/auth/ui/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(itemBuilder: (context,index)=>TaskItem(),
       separatorBuilder: (context,index)=>SizedBox(height: 12,), 
      itemCount: 10),
    );
  }
}