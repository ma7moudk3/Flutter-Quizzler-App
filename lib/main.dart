import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int numOfQuestion = 0;
  List<Icon> scores = [];
  List<Questions> questions = [
   Questions(q: 'Question 1 t', a: true),
   Questions(q: 'Question 2 f', a: false),
   Questions(q: 'Question 3 f ', a: false),
   Questions(q: 'Question 4 t', a: true),
   Questions(q: 'Question 5 t ', a: true),
  ];

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
                questions[numOfQuestion].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(questions[numOfQuestion].answer == true){
                    scores.add(Icon(Icons.check
                    ,color: Colors.green,
                    ));
                  }else{
                    scores.add(Icon(Icons.close
                      ,color: Colors.red,
                    ));
                  }
                  if(numOfQuestion < questions.length - 1)
                  numOfQuestion++;
                  else{
                    numOfQuestion = 0;
                    scores.clear();
                  }
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(questions[numOfQuestion].answer == false){
                    scores.add(Icon(Icons.check
                      ,color: Colors.green,
                    ));
                  }else{
                    scores.add(Icon(Icons.close
                      ,color: Colors.red,
                    ));
                  }
                  if(numOfQuestion < questions.length - 1)
                    numOfQuestion++;
                  else{
                    numOfQuestion = 0;

                  }

                });
              },
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}

class Questions {
  String question;
  bool answer;
  Questions({String q , bool a}){
    question = q;
    answer = a;
  }
}
