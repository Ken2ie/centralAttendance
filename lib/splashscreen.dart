import 'dart:async';

import 'package:class_attendance_app/api_services/getUserInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
void initState(){
  // TODO: implement initState
  startTimer();
  check();
  super.initState();
}
  Timer startTimer() {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

bool userLoggedin = false;

check() async{
    SharedPreferences user = await SharedPreferences.getInstance();
  dynamic userlogged = user.getString('userID');
  print(userlogged);
  
}

route() async{
    SharedPreferences user = await SharedPreferences.getInstance();
  dynamic userlogged = user.getString('userID');
  print(userlogged);

  if(userlogged != null){
    Navigator.of(context).pushReplacementNamed('/dashboard');
  } else if(userlogged == null){
    Navigator.of(context).pushReplacementNamed('/login');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     body : Center (
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Image.asset("assets/cu-logo.png"),
    ),
    Container(
      child: FutureBuilder(
        // future: StudentInfoService.getUserInfo(),
        builder: (context, snapshot) {
        return CircularProgressIndicator(
          color: Colors.red[900],
        );
      }),
    )
        ],
      ),
    ),
    );
  }
  
}