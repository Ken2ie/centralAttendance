import 'package:class_attendance_app/dashboard/dashboard.dart';
import 'package:class_attendance_app/login/forgot.dart';
import 'package:class_attendance_app/login/login.dart';
import 'package:class_attendance_app/login/register.dart';
import 'package:class_attendance_app/login/registerSecond.dart';
import 'package:class_attendance_app/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Poppins'),
    debugShowCheckedModeBanner: false,
    routes: {
      // SplashScreen
      "/": (context) => const Splash(),
      // "/intro": (context) => Intro(),

      // Sign, Signup, Forgot Password
      "/login": (context) => const Login(),
      "/register": (context) => const Register(),
      // "/registerS": (context) => const RegisterSecond(),
      "/forgot": (context) => const Forgot(),

      // Dashboard
      "/navigator": (context) => const Navigator(),
      "/dashboard": (context) => const Dashboard(),
    },
  ));
}
