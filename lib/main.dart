import 'package:flutter/material.dart';
import 'package:myapp/result.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

// here's a shorthand for functions which have one and exactly one expression
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

// Another way of defining it the above lines
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createStateprogress
  //   return _MyAppState();
  // }
}

// '_' changes this file from public to private

class _MyAppState extends State<MyApp> {
  // here we can also just define it as static const questions
  final _questions = const [
    // here we use {} to define a Map, i.e. a key-value pair
    {
     'questionText': 'What\'s your favourite company?',
     'answers': [
       {'text': 'Flipkart', 'score': 10},
       {'text': 'Google', 'score': 5},
       {'text': 'Microsoft', 'score': 3},
       {'text': 'Amazon', 'score': 1},
     ],
   },
   {
     'questionText': 'What\'s your favourite cricket team?',
     'answers': [
       {'text': 'India', 'score': 3},
       {'text': 'Pakistan', 'score': 11},
       {'text': 'Australia', 'score': 5},
       {'text': 'England', 'score': 9},
     ],
   },
   {
     'questionText': 'What\'s your favourite language?',
     'answers': [
       {'text': 'Java', 'score': 1},
       {'text': 'C++', 'score': 1},
       {'text': 'Javascript', 'score': 1},
       {'text': 'Python', 'score': 1},

      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    // dart have the concept of list as well

    // // var dummy = ['Hello'];
    // var dummy = const ['Hello']; // if we define it with const then we cannot add more elements to it, if we do it will show an error
    // dummy.add('amx');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if question is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
