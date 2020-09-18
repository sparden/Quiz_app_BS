import 'package:fex5/quizBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain=QuizBrain();

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper =[];

  void checkAnswer(bool userPicked){
    bool correctAnswer =quizBrain.getCorrectAnswer();

    setState(() {
      if(quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of quiz',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }
      else {
        if(userPicked == correctAnswer){
      scoreKeeper.add(Icon(Icons.check, color: Colors.green,),);
      }else{
      scoreKeeper.add(Icon(Icons.clear, color: Colors.red,),);
      }
      quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green.shade900,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red.shade900,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

