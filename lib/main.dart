import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 6}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1}
      ]
    }
  ];
  // class-wide variables are called properties
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    // setState forces the app to re-render the UI by calling the build method of the
    // widget where it is called. However, Flutter will not re-render the entire UI
    // but will only re-render what has changed.
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print(_questionIndex);
    }
  }

  // decorator - clarifies that we are deliberately overriding the build method
  @override
  // creates an object of type Widget that returns a MaterialApp Widget and
  // calls the build function that tells Flutter what/when to render on the screen
  // Note: all widgets are classes
  Widget build(BuildContext context) {
    return MaterialApp(
      // home is a named argument of the MaterialApp Widget
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App!'),
        ),
        // Column accepts a named argument children which can take a list of items
        // in this case it takes a list of Widgets. Type inference would have identified
        // this as a list of a Widgets, but this explicitly declares the data type.
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
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