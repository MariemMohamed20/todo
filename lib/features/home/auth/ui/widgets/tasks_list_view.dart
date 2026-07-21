import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/utils/app_constant.dart';
import 'package:todo/features/add%20task/model/task_model.dart';
import 'package:todo/features/home/auth/ui/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TaskModel>(AppConstant.TaskBox).listenable(),
      builder: (context, Box<TaskModel> box, _) {
        List<TaskModel> allTask = box.values.toList();

        if (allTask.isEmpty) {
          return Center(
            child: Lottie.asset("assets/icons/empty(1).json"),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: allTask.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final task = allTask[index];

            return Dismissible(
              key: ValueKey(task.key),
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.check, color: Colors.white),
              ),

              // ✨ التحكم في سلوك الاختفاء أو الرجوع
              confirmDismiss: (dismissDirection) async {
                if (dismissDirection == DismissDirection.startToEnd) {
                  // سحب يمين للحذف -> يرجع true عشان يختفي
                  return true;
                } else {
                  // سحب شمال للتكميل -> يغير الحالة ويرجع false عشان الكارت يرجع مكانه وما يضربش الأرور
                  if (task.status.toLowerCase() == "pending") {
                    task.status = "done";
                    task.save();
                  }
                  return false;
                }
              },

              onDismissed: (dismissDirection) {
                // الحذف الفعلي ينفذ فقط في حالة السحب للحذف
                if (dismissDirection == DismissDirection.startToEnd) {
                  task.delete();
                }
              },
              child: TaskItem(task: task),
            );
          },
        );
      },
    );
  }
}