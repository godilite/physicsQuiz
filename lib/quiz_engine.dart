import 'question.dart';
class QuizEngine {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question('Atoms are indivisible', false),
    Question('Potential energy can be referred to as energy due to position', true),
    Question('Heat can be measured with a thermometer', false),
  ];

  void nextQuestion(){
    if (_questionNumber < _questions.length - 1){
     _questionNumber++;
    }
  }
  String getQuestionText(){
    return _questions[_questionNumber].questionText;
  }
  bool getCorrectAns(){
    return _questions[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    if(_questionNumber >= _questions.length - 1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }
}