import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'main.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(answerText),
        // onPressed takes a function. However, if you were to write answerQuestion() instead,
        // dart would call the function immediately while parsing the file and NOT when the user
        // presses the button. We want this function to run when the user presses the button so we
        // instead add answerQuestion as a reference to the function and not the return value of the
        // function which in this case would be null since answerQuestion returns nothing or 'void'.
        // answerQuestion() - return value of the function
        // answerQuestion - pointer to the function itself
        onPressed: selectHandler,
      ),
    );
  }
}
