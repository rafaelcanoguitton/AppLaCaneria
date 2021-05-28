import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String textito;
  Answer(this.selectHandler,this.textito);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: Text(textito,style: TextStyle(color: Colors.black.withOpacity(1.0))),
          onPressed: selectHandler,
        ));
  }
}
