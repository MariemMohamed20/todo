import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/utils/app_constant.dart';
import 'package:todo/features/add%20task/model/task_model.dart';
import 'package:todo/features/home/auth/ui/widgets/task_item.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> allTask = Hive.box<TaskModel>(
      AppConstant.TaskBox,
    ).values.toList();
    return allTask.isEmpty
        ? Lottie.asset("assets/icons/empty(1).json")
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                background: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.red,
                  child: Icon(Icons.delete),
                ),
                secondaryBackground: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.green,
                  child: Icon(Icons.check),
                ),
                onDismissed: (dismissDirection) {
                  if (dismissDirection == DismissDirection.startToEnd) {
                    Hive.box<TaskModel>(AppConstant.TaskBox).deleteAt(index);
                    setState(() {
                      
                    });
                  } else {
                    if (allTask[index].status.toLowerCase() == "pending") {
                      var value = allTask[index];
                      value.status = "Completed";
                      Hive.box<TaskModel>(
                        AppConstant.TaskBox,
                      ).putAt(index, value);
                      setState(() {});
                    }
                  }
                },
                key: UniqueKey(),
                child: TaskItem(task: allTask[index]),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: allTask.length,
            ),
          );
  }
}
