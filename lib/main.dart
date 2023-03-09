import 'package:flutter/material.dart';

import './question.dart';

// may also be written as: void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

// Can be rebuilt
// all classes must extend either StatelessWidget or StatefulWidget
class MyApp extends StatefulWidget {
  @override
  // createState creates a State object at the location in the widget tree where the function
  // is called. In this case in creates a State object in the widget tree at the location
  // of MyAppState which returns the State of the associated MyApp class.
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// Persistent. MyAppState is named by convention but can be named anything.
// therefore we must indicate the class that this class holds the State for.
// The leading underscore converts the class to a Private class.
class _MyAppState extends State<MyApp> {
  // class-wide variables are called properties
  var _questionIndex = 0;

  void _answerQuestions() {
    // setState forces the app to re-render the UI by calling the build method of the
    // widget where it is called. However, Flutter will not re-render the entire UI
    // but will only re-render what has changed.
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  // decorator - clarifies that we are deliberately overriding the build method
  @override
  // creates an object of type Widget that returns a MaterialApp Widget and
  // calls the build function that tells Flutter what/when to render on the screen
  // Note: all widgets are classes
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      // home is a named argument of the MaterialApp Widget
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App!'),
        ),
        // Column accepts a named argument children which can take a list of items
        // in this case it takes a list of Widgets. Type inference would have identified
        // this as a list of a Widgets, but this explicitly declares the data type.
        body: Column(children: <Widget>[
          Question(questions[_questionIndex]),
          ElevatedButton(
            child: Text('Answer 1'),
            // onPressed takes a function. However, if you were to write answerQuestion() instead,
            // dart would call the function immediately while parsing the file and NOT when the user
            // presses the button. We want this function to run when the user presses the button so we
            // instead add answerQuestion as a reference to the function and not the return value of the
            // function which in this case would be null since answerQuestion returns nothing or 'void'.
            // answerQuestion() - return value of the function
            // answerQuestion - pointer to the function itself
            onPressed: _answerQuestions,
          ),
          ElevatedButton(
            child: Text('Answer 2'),
            onPressed: _answerQuestions,
          ),
          ElevatedButton(
            child: Text('Answer 3'),
            onPressed: _answerQuestions,
          ),
        ]),
      ),
    );
  }
}

/* NOTES
Shorthand notation for a one-time use function is () => <CODE>;
  or () {
    <CODE>;
  }
  This is used when you only want to call a function once and never reference it 
  again anywhere else in the code which would be impossible since it has no name.

Stateless widgets rerender when external input changes
Stateful widgets rerender when external input changes OR the internal state changes.

State persists. The StatefulWidget class is recreated when it is rerendered, but
the State class persists the data through rerendering.


  */