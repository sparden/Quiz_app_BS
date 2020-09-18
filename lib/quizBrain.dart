import 'Questions.dart';

class QuizBrain{
  int _questionNumber = 0;

List<Questions> _questionBank=[
  Questions(q:'India\'s Prime Minister is Modi',a: true),
  Questions(q:'We have more than 2 eyes',a:false),
  Questions(q:'Ram killed ravan',a:true),
  Questions(q:'3+2=6',a:false),
];

void nextQuestion(){
  if(_questionNumber < _questionBank.length - 1) {
    _questionNumber++;
  }
}

String getQuestionText(){
  return _questionBank[_questionNumber].questionText;
}
bool getCorrectAnswer(){
  return _questionBank[_questionNumber].questionAnswer;
}

bool isFinished(){
  if(_questionNumber >= _questionBank.length-1){
    print('Now returning true ');
    return true;
  } else {
    return false;
  }
}

void reset(){
  _questionNumber=0;
}
}