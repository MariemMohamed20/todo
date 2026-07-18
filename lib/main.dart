import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/utils/app_constant.dart';
import 'package:todo/features/home/auth/data/models/user_model.dart';

import 'package:todo/todo_app.dart';


void main()async {
 await Hive.initFlutter();
 Hive.registerAdapter(UserModelAdapter());
 await Hive.openBox<UserModel>(AppConstant.UserBox);
  runApp(TodoApp());
}
                