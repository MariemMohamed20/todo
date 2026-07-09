
import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name",style: AppTextStyle.bodylargeStyle,),
        SizedBox(height: 10,),
        TextFormField(
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            hintText: "Enter your name",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:BorderSide.none
            ),
          ),
        ),
      ],
    );
  }
}