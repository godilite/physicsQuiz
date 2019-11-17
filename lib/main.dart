import 'package:flutter/material.dart';
import 'quiz_engine.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

  /*This in this project I used three packages including the material design as
    you can see above. this packages can be gotten from the official flutter
    package manager pub.dev, Notice in line two I imported a file quiz_engine.dart
    I will explained that in a bit.
  */
void main() => runApp(Phy101());
QuizEngine quizEngine =  QuizEngine(); //here we call a class from the file quiz_engine.dart, this is called abstraction in OOP
class Phy101 extends StatelessWidget { //this is a statelessWidget class which means that the contents here will never change once app runs
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( //this is a scaffold, a blank screen for the app.
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: PhyPage(), //here we call a stateful class which contains dynamic contents of our app
            ),
        ),
      ),
    );
  }
}
class PhyPage extends StatefulWidget { //this is a stateful widget class where we can change its contents as the state changes
  @override
  _PhyPageState createState() => _PhyPageState();
}

class _PhyPageState extends State<PhyPage> {
  @override

  List<Icon> scoreKeeper = []; // this is how to define a variable in flutter to accept a specific data type,
  // in this case we use a List to accept oly icons

  void checkAnswer(bool userPickedAnswer){ //this class is called when a true/false button is clicked to confirm answers
    if(quizEngine.isFinished()==true){
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
        buttons: [
          DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      final player = AudioCache();
      player.play('381355__funwithsound__applause-1.mp3');
      quizEngine.reset();
      scoreKeeper = [];
    }else {
      bool correctAnswer = quizEngine.getCorrectAns(); //here we call the answers from da
      setState(() { //we call the setState method to change the state of our application
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add( //this add method updates the scoreKeeper array on line 59
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          final player = AudioCache();

          player.play('421002__eponn__correct.wav');
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          final player = AudioCache();

          player.play('131657__bertrof__game-sound-wrong.wav');
        }
        quizEngine.nextQuestion();
      });
    }
  }
  Widget build(BuildContext context) { //this widget contains the UI of our app
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(quizEngine.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
                onPressed: (){
               checkAnswer(true);
              },
                child: Text('True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
                ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: (){
                checkAnswer(false);
              },
              child: Text('False',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
