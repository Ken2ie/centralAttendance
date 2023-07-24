import 'dart:async';
// import 'dart:ffi';

// import 'package:class_attendance_app/screens/main/mainscreen.dart';
import 'package:class_attendance_app/dashboard/dashboard.dart';
import 'package:class_attendance_app/login/login.dart';
import 'package:class_attendance_app/login/registerSecond.dart';
import 'package:flutter/material.dart';
import 'package:class_attendance_app/components/navigator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
void initState(){
  // Implement initState
  startTimer();
  super.initState();
}
  Timer startTimer() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }


route(){
  // Navigator.of(context).pushReplacementNamed('/navigator');
   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Login()),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(153, 38, 33, 1),
     body : Center (
      child: Container(
      // color: Colors.white,
      child: Image.asset("assets/cu-logo.png"),
    ),
    ),
    );
  }
  
}