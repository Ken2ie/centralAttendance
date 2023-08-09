import 'dart:async';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  super.initState();
}
  Timer startTimer() {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }


route(){
  Navigator.of(context).pushReplacementNamed('/login');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     body : Center (
      child: Container(
      color: Colors.black,
      child: Image.asset("assets/cu-logo.png"),
    ),
    ),
    );
  }
  
}