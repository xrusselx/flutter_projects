import 'package:flutter/material.dart';

import './text_control.dart';
import './text_display.dart';

void main() => runApp(FirstAssignmentApp());

class FirstAssignmentApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstAssignmentAppState();
  }
}

class _FirstAssignmentAppState extends State<FirstAssignmentApp> {
  String _text = "Hello, World!";
  void _changeText() {
    setState(() {
      _text = "Hello, Solar System!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Assignment"),
        ),
        body: Column(children: [
          TextDisplay(_text),
          TextControl(_changeText),
        ]),
      ),
    );
  }
}
