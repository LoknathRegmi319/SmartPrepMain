import 'package:flutter/material.dart';
// it contains our colors.
class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
    {super.key, 
    required this.question,
  required this.indexAction,
  required this.totalQuestions});
  // here we need the question title and the total number of questions, and also the index

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Question ${indexAction + 1}/$totalQuestions: $question',
      style: const TextStyle(
        fontSize:24.0,
        color: Color.fromARGB(255, 37, 39, 171),
      ), 
      ),
    );
  }
}