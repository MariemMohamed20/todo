
import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';

class CustomTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextFormFeild({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name",style: AppTextStyle.bodylargeStyle,),
        SizedBox(height: 10,),
        TextFormField(
          controller: controller,
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
          validator: (value) {
            if(value==null || value.isEmpty){
              return "Please enter your name";
            }
            else if(value.length<3){
              return "Name must be at least 3 characters";
            }
            return null;
          },

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            hintText: "Enter your name",
           border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              
              ),
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