import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class Quizpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> mesarguments = 
                 ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    String jsonfile = mesarguments['langfile'] as String;

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(jsonfile, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        // ignore: unnecessary_null_comparison
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return Quiz(mydata: mydata);
        }
      },
    );
  }
}

class Quiz extends StatefulWidget {
  final List mydata;
  const Quiz({super.key, required this.mydata});
  
  @override
  _QuizState createState() => _QuizState(mydata);
}

class _QuizState extends State<Quiz> {
  final List mydata;
  _QuizState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  String righticon = "✔️  ";
  String wrongicon = "✖️  ";

  int score = 0;
  int i = 0;
  bool disableAnswer = false;
  bool canceltimer = false;
  int timer = 30;
  String showtimer = "30";
  String icon = "";

 Map<int, String> symbolIcon = {
    1: "",
    2: "",
    3: "",
    4: "",
  };
  Map<int, String> optionLetter = {
    1: "  A",
    2: "  B",
    3: "  C",
    4: "  D",
  };
  Map<int, Color> btncolor = {
    1: Colors.indigoAccent,
    2: Colors.indigoAccent,
    3: Colors.indigoAccent,
    4: Colors.indigoAccent,
  };

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> quitconfirm(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirmation'
            ),
          content: Text("Vous êtes sûre de quitter le Quiz ?",),
          contentPadding: EdgeInsets.all(20.0),
          actions: [
            TextButton(
              child: Text('Non'),
              onPressed: () => Navigator.pop(context as BuildContext,false)
            ),
            TextButton(
              child: Text('Oui'),
              onPressed: () {
                canceltimer == true;
                Navigator.pushNamed(
                  context as BuildContext,
                  '/homepage',
                  arguments: {} 
                );
              },
            ),
          ]
        );
      }
    );
  }

  Widget cancelbutton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        child: Text(
          'Annuler',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        onPressed: () => quitconfirm(this.context),
        color: Colors.indigo[700],
        minWidth: 150.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (i < mydata.length-1) {
        i++;
      } else {
        canceltimer = true;
        Navigator.pushNamed(
          this.context,
          '/scorepage',
          arguments: {
            'score': '$score',
            'nbrquestion': '${mydata.length}'}
        );
      }
      symbolIcon[1] = "";
      symbolIcon[2] = "";
      symbolIcon[3] = "";
      symbolIcon[4] = "";
      btncolor[1] = Colors.indigoAccent;
      btncolor[2] = Colors.indigoAccent;
      btncolor[3] = Colors.indigoAccent;
      btncolor[4] = Colors.indigoAccent;
      disableAnswer = false;
    });
    starttimer();
  }

  Widget submitquestion() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () =>  nextquestion(),
        child: Text(
          'Soumettre la Question',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        color: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  void checkanswer(int k) {
    if (mydata[i]['answer'.toString()] == k-1) {
      score = score + 1;
      colortoshow = right;
      icon = righticon;
    } else {
      colortoshow = wrong;
      icon = wrongicon;
    }
    setState(() {
      btncolor[k] = colortoshow;
      symbolIcon[k] = icon;
      btncolor[mydata[i]['answer'.toString()]+1] = right;
      symbolIcon[mydata[i]['answer'.toString()]+1] = righticon;
      disableAnswer = true;
    });
    Timer( Duration(seconds: 2), (){} );
  }

  Widget optionbutton(int k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 100.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
            optionLetter[k]!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              ),
            ),
            Text(
            mydata[i]['options'.toString()][k-1],
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              ),
            ),
            Text(
            symbolIcon[k]!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              ),
            )
          ]
        ),
        color: btncolor[k],
        minWidth: 250.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          "Question ${i+1}/${mydata.length}",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                ),
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Text(
                  "Attention : 👉  Il vous reste ${showtimer} secondes  ⏱️",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                  ),
                ),
              )
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "${i+1})  ${mydata[i]['question'.toString()]}",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: AbsorbPointer(
                absorbing: disableAnswer,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      optionbutton(1),
                      optionbutton(2),
                      optionbutton(3),
                      optionbutton(4),
                    ],
                  ),
                ),
              ),
            ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  submitquestion(),
                  cancelbutton()
                ]
              )
            ),
          ),
        ],
      ),
    );
  }
}