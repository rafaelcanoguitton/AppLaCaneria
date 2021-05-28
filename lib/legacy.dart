import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

//void main()=> runAPp(MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var questionsScore=0;
  final questions = const [
    {
      'questionText': 'What\'s es tu pingors favorita?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'cual es tu animal mas gosu',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Efelante', 'score': 2},
        {'text': 'Leon', 'score': 1}
      ],
    },
    {
      'questionText': 'cual es pinga',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10}
      ],
    }
  ];
  void answerQuestion(int n) {
    setState(() {
      if (questionIndex < questions.length) {
        questionIndex = questionIndex + 1;
        questionsScore+=n;
      } else {
        questionIndex = 0;
      }
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                handlerpe: answerQuestion,
                questions: questions,
                questionIndex: questionIndex)
            : Resultado(questionsScore),
      ),
    );
  }
}
