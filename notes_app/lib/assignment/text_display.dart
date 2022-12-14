import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final String text;

  TextDisplay(this.text);
  @override
  Widget build(BuildContext context) {
    return Center(
      // width: double.infinity,
      child: Text(
        text,
        // textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
