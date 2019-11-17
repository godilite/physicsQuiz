import 'question.dart';
class QuizEngine {
  int _questionNumber = 0; //the underscore sign makes the variable to be private, therefore it is only accessible by the QuizEngine class
  List<Question> _questions = [ // remember how we declare a List in Dart? here we give it a type Question,
    Question('Atoms are indivisible', false), //Question is already constructed in question.dart file to expect a pair of question text and answer, you can check the file
    Question('Potential energy can be referred to as energy due to position', true),
    Question('Heat can be measured with a thermometer', false),
  ];

  void nextQuestion(){
    if (_questionNumber < _questions.length - 1){
     _questionNumber++;
    }
  }
  String getQuestionText(){ // the function returns the text of the question
    return _questions[_questionNumber].questionText;
  }
  bool getCorrectAns(){ //here get answer for the quiz question
    return _questions[_questionNumber].questionAnswer;
  }

  bool isFinished(){ //here check if the user has reached the final question
    if(_questionNumber >= _questions.length - 1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){ //this is called at the end of the quiz to set the item number to zero and restart
    _questionNumber = 0;
  }
}