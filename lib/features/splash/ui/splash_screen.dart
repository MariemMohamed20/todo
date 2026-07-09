


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/features/home/auth/ui/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: 
      Center(child: Lottie.asset("assets/icons/splash.json"))
    );
  }
}