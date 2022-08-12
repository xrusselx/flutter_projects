import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "question": "What's your favorite color?",
      "answers": [
        {"text": "blue", "score": 8},
        {"text": "red", "score": 4},
        {"text": "white", "score": 10},
        {"text": "green", "score": 6},
      ],
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {"text": "dog", "score": 10},
        {"text": "cat", "score": 8},
        {"text": "chicken", "score": 6},
      ],
    },
    {
      "question": "Who's your favorite teacher?",
      "answers": [
        {"text": "Russel", "score": 10},
        {"text": "Rhonlee", "score": 8},
        {"text": "Rhoen", "score": 6},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex == _questions.length) {
        print("No more questions!");
        // _questionIndex = 0;
      }
    });
  }

  void _restartApp() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Quiz App",
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _restartApp),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _restartApp,
        //   tooltip: "Restart",
        //   child: Icon(Icons.restart_alt),
        // ),
      ),
    );
  }
}
