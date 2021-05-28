import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  var score;
  Resultado(this.score);
  String get resultPharse{
    var resultText='Conchatumakina tu scoire es: ';
    return resultText+=score.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(resultPharse));
  }
}