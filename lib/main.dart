import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/utils/app_constant.dart';
import 'package:todo/features/add%20task/model/task_model.dart';
import 'package:todo/features/home/auth/data/models/user_model.dart';

import 'package:todo/todo_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<UserModel>(AppConstant.UserBox);
  await Hive.openBox<TaskModel>(AppConstant.TaskBox);
  runApp(TodoApp());
}
