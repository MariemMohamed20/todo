


import 'dart:io';

import 'dart:io'; // 1. Added this missing import for the File class

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_constant.dart';
import 'package:todo/features/home/auth/data/models/user_model.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box<UserModel>(AppConstant.UserBox);
    
    // 2. Fetching the user data from the box (safely checking if it's not empty)
    final userData = userBox.isNotEmpty ? userBox.getAt(0) : null;

    return Row(
      children: [
        // 3. Cleaned up the CircleAvatar and replaced the nested Image.file with FileImage
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: userData?.image != null && (userData!.image??"").isNotEmpty
              ? FileImage(File(userData.image??""))
              : null,
          child: (userData?.image == null || (userData!.image??"").isEmpty)
              ? const Icon(Icons.person, size: 45, color: Colors.grey)
              : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning👋",
                style: AppTextStyle.hintStyle,
              ),
              Text(
                userData?.name ?? "Guest", // Fallback name if data is empty
                style: AppTextStyle.bodylargeStyle,
              ),
            ],
          ),
        ),
        const Icon(Icons.notifications_active_outlined, size: 30),
      ],
    );
  }
}