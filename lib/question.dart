import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // Text takes up only the space it needs so wrapping it in a Container allows
    // us to increase the allocated space. The double.infinity width means that the
    // Container will take up the entire width of the screen no matter which device
    // is used; this allows the TextAlign.center to center throughout the new allocated
    // width and not be limited to the original size of the Text widget.
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
