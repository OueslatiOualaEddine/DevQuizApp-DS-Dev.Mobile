import 'package:flutter/material.dart';

class Scorepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<String,String> arguments = 
                  ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    String strscore = arguments['score'] as String;
    String nbrquestionch = arguments['nbrquestion'] as String;
    var score = int.parse(strscore);
    final nbrquestion = int.parse(nbrquestionch);

    return Score(score: score, nbrquestion: nbrquestion);
  }
}

class Score extends StatefulWidget {
  final int score;
  final int nbrquestion;
  const Score({super.key, required this.score, required this.nbrquestion});

  @override
  _ScoreState createState() => _ScoreState(score, nbrquestion);
}

class _ScoreState extends State<Score> {
  final int score;
  final int nbrquestion;
  _ScoreState(this.score, this.nbrquestion);

  late String message;
  late String imagefile;
  
  @override
  void initState(){
    if(score < ((nbrquestion/100)*50)){
      imagefile = "../../images/quizresult/bad.png";
      message = '''🤏 Not that Bad 😐\n
                You Should Try Again, but Harder...''';
    }else if(score < ((nbrquestion/100)*75)){
      imagefile = "../../images/quizresult/good.png";
      message = '''👍 Good Job ! 🙂\n
              You Can Do Better Next Time..''';
    }else{
      imagefile = "../../images/quizresult/success.png";
      message = '''🎖️ Congradulation !!! 😀\n
                You Passed the Quiz Successfully''';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Résultat du Quiz",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              )
            )
          ),
          Expanded(
            flex: 4,
            child: Material(
              child: Container(
                width: 300.0,
                height: 300.0,
                child: ClipRect(
                  child: Image(
                    image: AssetImage(
                      imagefile,
                    ),
                  ),
                ),
              ),
            ),            
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 100.0,
                  ),
                  child: Material(
                    color: Colors.indigoAccent,
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                '''You got $score/$nbrquestion questions Right\n
                                  Your score is ${(score/nbrquestion)*20}/20''',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              child: Text(
                                'Menu Principale',
                                style: TextStyle(fontSize: 18.0,),
                                ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/homepage',
                                  arguments: {} 
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}