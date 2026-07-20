import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_color.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/features/add%20task/ui/add_task_screen.dart';

import 'package:todo/features/home/auth/ui/widgets/home_app_bar.dart';
import 'package:todo/features/home/auth/ui/widgets/task_states_card.dart';
import 'package:todo/features/home/auth/ui/widgets/tasks_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              SizedBox(height: 20),
              TaskStatesCard(),
              SizedBox(height: 20),

              Text("Today is Tasks", style: AppTextStyle.headlineStyle),
              SizedBox(height: 12),
              TasksListView(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
         await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          setState(() {

          });
        },
        backgroundColor: AppColor.primaryColor,
        focusColor: Colors.white,
        label: Row(
          children: [
            Icon(Icons.add, color: Colors.white),
            Text(
              "Task",
              style: AppTextStyle.bodylargeStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
