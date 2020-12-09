import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text':
              'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3. Which programing language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programing language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': 0},
        {'text': 'Jeremy Ashkenas', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'True',
          'score': 0,
        },
        {'text': 'False', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q6. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'True',
          'score': 0,
        },
        {'text': 'False', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q7. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'True',
          'score': 0,
        },
        {'text': 'False', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q8. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'True',
          'score': 0,
        },
        {'text': 'False', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q9. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'True',
          'score': 0,
        },
        {'text': 'False', 'score': 10},
      ],
    },
    {
      'questionText':
          '10. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'True',
          'score': 0,
        },
        {'text': 'False', 'score': 10},
      ],
    },
  ];

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

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jingyi Huo - Quiz App '),
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
