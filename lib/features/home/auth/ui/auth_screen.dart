import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/app_bottom.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/widgets/custom_text_form_feild.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final picker = ImagePicker();
  XFile? image;

  void pickfromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void pickfromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Select"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                pickfromCamera();
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.camera),
                            ),
                            IconButton(
                              onPressed: () {
                                pickfromGallery();
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.browse_gallery),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child: image != null ? null : Icon(Icons.person, size: 60),
                  backgroundImage: image != null
                      ? Image.file(File(image?.path ?? "")).image
                      : null,
                ),
              ),
              const SizedBox(height: 30),
              Text("Create Your Profile", style: AppTextStyle.headlineStyle),
              const SizedBox(height: 15),
              Text(
                "Add your name and a profile picture",
                style: AppTextStyle.hintStyle,
              ),
              const SizedBox(height: 30),
              const CustomTextFormFeild(),
              const SizedBox(height: 30),
              const AppBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
