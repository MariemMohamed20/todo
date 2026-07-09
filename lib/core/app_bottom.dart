


import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_color.dart';
import 'package:todo/core/theme/app_text_style.dart';

class AppBottom extends StatelessWidget {
  const AppBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius:BorderRadius.circular(20),
        ),
      child: Text("Continue",
      style:AppTextStyle.bodylargeStyle.copyWith(
        color: Colors.white
      ) ,
      )
    );
  }
}