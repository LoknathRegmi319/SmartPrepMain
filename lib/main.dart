// import the material package
import 'package:flutter/material.dart';
import 'package:SmartPrep/models/question_model.dart';
import './screens/home_screen.dart';  //the file we just created.
import './models/db_connect.dart';
// run the main method
void main(){
  var db = DBconnect();
   // db.addQuestion(Question(id: '20', title: 'What is 20 x 100 ?', options: {
   //  '100':false,
   // '200':true,
   //  '300':false,
   //  '500':false,
   // }));
   db.featchQuestions();
   // the runApp method
  runApp(
    const MyApp(),   //we will create this below
  );
  }

  //create the MyApp widget
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // remove the debug banner
      debugShowCheckedModeBanner: false,
      // set a homepage
     home: HomeScreen(),//we will create this in separate file.
    );
  }
}