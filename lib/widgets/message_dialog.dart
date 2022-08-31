import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {

  final String text;
  final Color color;

  const MessageDialog({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 250.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      color: Colors.black87,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: color,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}