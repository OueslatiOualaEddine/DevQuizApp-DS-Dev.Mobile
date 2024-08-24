import 'package:quiz_app_ds/homepage.dart';
import 'package:quiz_app_ds/quizpage.dart';
import 'package:quiz_app_ds/scorepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(QuizAppDS());

class QuizAppDS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => Homepage(),
        '/quizpage': (context) => Quizpage(),
        '/scorepage': (context) => Scorepage(),
      }
    );
  }
}
