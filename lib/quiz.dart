import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  // const Quiz({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
        // ElevatedButton(
        //   // here we are creating an anonymous function, it is anonymous because it has no name, just the function body, Anonymous function is a good idea when we don't need to call it at anyother place, if we want to use a function at many place then we'll define it first like we have defined the answerQuestion function here and then just write the name of the function after the onpressed with using the '()' after the function name, if we define the function name with () then it will call the function immediately, but we want to call the function only when we press the button, so we'll only write the function name without using the parenthesis
        //   onPressed: () => print('Answer 2 chosen!'),
        //   child: Text('Answer 2'),
        // ),
        // ElevatedButton(
        //   onPressed: () {
        //     // ...
        //     print('Answer 3 chosen!');
        //   },
        //   child: Text('Answer 3'),
        // ),
      ],
    );
  }
}
