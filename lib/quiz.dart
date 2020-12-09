import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int timer = 60;
  String showtimer = "60";
  bool canceltimer = false;
  var random_array;
  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          widget.questions[widget.questionIndex]['questionText'],
        ), //Question
        ...(widget.questions[widget.questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => widget.answerQuestion(answer['score']), answer['text']);
        }).toList(),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blueGrey[100],
            alignment: Alignment.topCenter,
            child: Center(
              child: Text(
                showtimer,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Times New Roman',
                ),
              ),
            ),
          ),
        ),
      ],
    ); //Column
  }
}
