import 'dart:async';
// import 'dart:ffi';

// import 'package:class_attendance_app/screens/main/mainscreen.dart';
import 'package:class_attendance_app/dashboard/dashboard.dart';
import 'package:class_attendance_app/login/login.dart';
import 'package:class_attendance_app/login/registerSecond.dart';
import 'package:flutter/material.dart';
import 'package:class_attendance_app/components/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

bool logged = false;


class _SplashState extends State<Splash> {

 

@override
void initState(){
  // Implement initState
  startTimer();
  getLoggedInUser();
  super.initState();
}
  Timer startTimer() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, getLoggedInUser);
  }

Future getLoggedInUser() async {
   SharedPreferences user = await SharedPreferences.getInstance();
  dynamic loggedIn = user.getString('token');
  // print(loggedIn);

  var empty = '';

  if(loggedIn != null){
    logged = true;
    routerDasboard();

  }else if(loggedIn == null){
    logged = false;
    routeLogin();
  }

  return logged;
}


routeLogin(){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Login()),
  );
}

routerDasboard(){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Dashboard(userAccesstoken: null,)),
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