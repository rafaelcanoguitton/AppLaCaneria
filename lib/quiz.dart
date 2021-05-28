import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';
class Quiz extends StatelessWidget {
  final Function handlerpe;
  final List<Map<String,Object>> questions;
  final questionIndex;
  Quiz({@required this.handlerpe,@required this.questions,@required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
                Question(questions[questionIndex]['questionText']),
                ...(questions[questionIndex]['answers'] as List<Map<String,Object>>)
                    .map((answer) {
                  return Answer(()=>handlerpe(answer['score']), answer['text']);
                }).toList()
              ]);
  }
}