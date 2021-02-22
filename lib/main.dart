import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questions = [
    {
      'questionText': 'what\'s your favourite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    }, //map class . you can create in a different way by using Map()

    {
      'questionText': 'what\'s your favourite animal ?',
      'answers': [ 
        {'text': 'Dog', 'score': 10},
        {'text': 'Cow', 'score': 5},
        {'text': 'Lion', 'score': 3},
        {'text': 'Tiger', 'score': 1}],
    },

    {
      'questionText': 'what\'s your favourite bird ?',
      'answers': [ 
        {'text': 'Crow', 'score': 10},
        {'text': 'Peacock', 'score': 5},
        {'text': 'Parrot', 'score': 3},
        {'text': 'Pigeon', 'score': 1}],
    },
  ];
  var _questionIndex = 0;
  var _totalscore=0;

  void resetquiz()
  {
    setState(() {
       _questionIndex = 0;
    _totalscore=0;
    });
   
  }
   
  void _answerquestion(int score) {
    //var aBool =true;
    //aBool=false;
    _totalscore= _totalscore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
      print('we have more questions');
    } else {
      print('you are done!');
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    //questions =[];it's does not work if questions in const

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < questions.length
          ? Quiz(
              answerquestion: _answerquestion,
              questionIndex: _questionIndex,
              questions: questions,
            )
          : Result(_totalscore,resetquiz),
    ));
  }
}
