import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resethandler;

  Result(this.resultscore, this.resethandler);

  String get resultPhrase {
    //getting
    var resultText;
    if (resultscore <= 8) {
      resultText = 'you are awesome and innocent';
    } else if (resultscore <= 12) {
      resultText = 'you are pretty likeable';
    } else if (resultscore <= 16) {
      resultText = 'you are strange';
    } else {
      resultText = 'you are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase, //replaced with you did it
            style: TextStyle(
                color: Colors.blue, fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              child: Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onPressed: resethandler,
              textColor: Colors.deepPurple[200])
        ],
      ),
    );
  }
}
