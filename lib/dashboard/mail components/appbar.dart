import 'package:flutter/material.dart';

class messageAppBar extends StatefulWidget {
  const messageAppBar({super.key});

  @override
  State<messageAppBar> createState() => _messageAppBarState();
}

class _messageAppBarState extends State<messageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
    );
  }
}