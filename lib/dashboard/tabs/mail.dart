import 'package:class_attendance_app/dashboard/tabs/analytics.dart';
import 'package:class_attendance_app/login/infor.dart';
import 'package:flutter/material.dart';

class Mail extends StatefulWidget {
  const Mail({super.key});

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    return Analytics();
  }
}