import 'package:flutter/material.dart';
import 'dart:async';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          "Basic Web-Dev Quiz",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        )
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '''Instruction : \n
              En cliquant sur le bouton << Start Quiz >> de 
              l'un des Language de Développement Web basique, 
              vous aurez des questions à répondre par sélectionner 
              l'un des 4 choix et à la fin vous trouvez votre résultats.\n
              Bonne Chance ! 😁''',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: Material(
              color: Colors.indigoAccent,
              elevation: 10.0,
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(100.0),
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                '../../images/langimg/htmllogo.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "HTML",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        '''Définition du HTML : \n
                        HTML (HTML: HyperText Markup Language) est un langage de balisage 
                        conçu pour structurer sémantiquement les pages web et 
                        pour la mis en forme du contenu.''',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(fontSize: 18.0,),
                          ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/quizpage',
                            arguments: {'langfile': 'htmlquiz.json'} 
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: Material(
              color: Colors.indigoAccent,
              elevation: 10.0,
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(100.0),
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                '../../images/langimg/csslogo.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "CSS",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        '''Définition du CSS : \n
                        CSS (CSS: Cascading Style Sheets) est un langage de mise en page et 
                        de structuration de pages Web (HTML ou XML) qui est composé 
                        des feuilles de style en cascade''',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(fontSize: 18.0,),
                          ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/quizpage',
                            arguments: {'langfile': 'cssquiz.json'} 
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: Material(
              color: Colors.indigoAccent,
              elevation: 10.0,
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(100.0),
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                '../../images/langimg/jslogo.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "JS",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        '''Définition du JS : \n
                        JS (JS: JavaScript) est un langage de programmation de scripts 
                        employé dans les pages web interactives représentant 
                        une partie essentielle des applications web.''',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(fontSize: 18.0,),
                          ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/quizpage',
                            arguments: {'langfile': 'jsquiz.json'} 
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}