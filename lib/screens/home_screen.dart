// import the material package

import 'package:flutter/material.dart';
import 'package:SmartPrep/widgets/option_card.dart';
import '../constants.dart';
import '../models/question_model.dart';  //our question model
import '../widgets/question_widget.dart';  //the question widget
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';
// create the HomeScreen widget
// I'm taking the Stateful widget because it's going to be out parent widget and all the 
//function and variabls will be in this widget so we will need to change starte of our widget.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  final List<Question> _questions =[
    Question(
      id: '10',
      title: ' What does HTML stand for?',
      options: {
        ' Hyperlinks and Text Markup Language' :false,
        'HyperText Markup Language' :true, 
         'Home Tool Markup Language' :false, 
         'HyperText Machine Language' :false},
      ),
      Question(
      id: '11',
      title: 'Which HTML tag is used to create a hyperlink?',
      options: {
        ' <a>' :true,
      ' <link>' :false, 
      '<href>' :false, 
      '<url>' :false},
      ),
      Question(
        id: '12',
        title: 'Which tag is used to display a picture in HTML?',
        options: {
          '<img>': true,
          '<picture>': false,
          '<photo>': false,
          '<image>': false,
        },
      ),
      Question(
        id: '13',
        title: 'Which HTML attribute is used to define inline styles?',
        options: {
          'style': true,
          'class': false,
          'id': false,
          'css': false,
        },
      ),
      Question(
        id: '14',
        title: 'Which HTML element is used to define the document type?',
        options: {
        
          '<html>': false,
          '<head>': false,
          '<doctype>': true,
          '<body>': false,
        },
      ),
      Question(
        id: '15',
        title: 'Which HTML element is used to define a table row?',
        options: {
          '<tr>': true,
          '<td>': false,
          '<th>': false,
          '<table>': false,
        },
      ),
      Question(
        id: '16',
        title: 'Which HTML element is used to define a table header?',
        options: {
          '<th>': true,
          '<tr>': false,
          '<td>': false,
          '<table>': false,
        },
      ),
      Question(
        id: '17', 
        title: 'Which CSS property is used to change the text color of an element?',
         options:{
          'color': true,
          'background-color': false,
          'font-size': false,
          'text-decoration': false,
         } 
      ),
      Question(
        id: '18',
        title: 'Which CSS property is used to change the font size of an element?',
         options:{
          'font-size': true,
          'font-family': false,
          'text-align': false,
          'line-height': false,
         }
      ),
      Question(
        id: '19',
        title: 'Which CSS property is used to change the background color of an element?',
         options:{
          'background-color': true,
          'color': false,
          'font-size': false,
          'text-decoration': false,
         }
      ),
      Question(
        id: '20',
        title: 'Which CSS property is used to change the font family of an element?',
         options:{
          'font-family': true,
          'font-size': false,
          'text-align': false,
          'line-height': false,
         }
      ),
      Question(
        id: '21',
        title: 'Which CSS property is used to change the text alignment of an element?',
         options:{
          'text-align': true,
          'text-decoration': false,
          'font-size': false,
          'line-height': false,
         }
      ),
      Question(
        id: '22',
        title: 'Which CSS property is used to change the line height of an element?',
         options:{
          'line-height': true,
          'font-size': false,
          'text-align': false,
          'text-decoration': false,
         }
      ),
      Question(
        id: '23',
        title: 'Which CSS property is used to change the font weight of an element?',
         options:{
          'font-weight': true,
          'font-size': false,
          'text-align': false,
          'line-height': false,
         }
      ),
      Question(
        id: '24',
        title: 'Which CSS property is used to change the text decoration of an element?',
         options:{
          'text-decoration': true,
          'font-size': false,
          'text-align': false,
          'line-height': false,
         }
      ),
  ];

// create an index to loop through _questions
int index = 0;
// create a score variable
int score =0;
//creatte a boolen value to check if the user has clicked
bool isPressed = false;
//create a function to display the next question
bool isAlreadySelected = false;
void nextQuestion() {
  if(index == _questions.length -1){
    // this is the block where the questions end.
    showDialog(
      context: context, 
      barrierDismissible: 
      false,   // this will disable the dissmis function on clicking outside of box
      builder: (ctx) => ResultBox(
      result: score,   // total points the user got
      questionLength: _questions.length,   // out of how many questions
      onPressed: startOver,
    ));
    } else {
      if(isPressed){
        
         setState(() {
         index++;  //when the index will change to 1. rebuild the app.
         isPressed = false;
         isAlreadySelected = false;
       });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select any option'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
    }
 }
}
  
  //create a function for changing color
  void checkAnswerAndUpdate(bool value) {
    if(isAlreadySelected){
      return;
    } else {
      if(value == true) {
      score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
     }
    }

  // create a function to start over
  void startOver() {
    setState(() {
      index = 0;
    score = 0;
    isPressed = false;
    isAlreadySelected = false;
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      // change the background 
      backgroundColor: background,
      appBar: AppBar( 
        title: const Text('Smartprep'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(padding: const EdgeInsets.all(18.0), 
          child: Text('Score: $score',
          style: const TextStyle(fontSize: 18.0),
          ),
          ),
        ],
      ),
       body: Container(
       width: double.infinity,
       padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
      children:[
        // add the questionWidget here
        QuestionWidget(
          indexAction: index,  // currently at 0.
          question: _questions[index].title,  // means the first question in the list.
          totalQuestions: _questions.length,  // total length of the list
          ),
          const Divider(color: neutral),
          // add some space
          const SizedBox(height:25.0),
          for (int i=0; i< _questions[index].options.length; i++)
            GestureDetector(
              onTap: () => checkAnswerAndUpdate(
                _questions[index].options.values.toList()[i]),
              child: OptionCard(
                option: _questions[index].options.keys.toList()[i],
                color: isPressed 
                   ? _questions[index].options.values.toList()[i] == true
                      ? correct
                      : incocorrect 
                   :neutral,
                 ),
            ),
           ],
         ),  
      ), 

      // use the floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,  //the above function
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );  
  }
}

// import this file to oour main.dart file