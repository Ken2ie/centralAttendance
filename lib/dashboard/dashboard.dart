import 'package:class_attendance_app/components/navigator.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        resizeToAvoidBottomInset: false,
        // drawer: Drawer(),
        // drawerEnableOpenDragGesture: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   title: Text('Home'),
        // ),
        body: Navigation(),
      )
      );
  }
}