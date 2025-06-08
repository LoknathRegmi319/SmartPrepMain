import 'package:http/http.dart' as http;  // the http package
import './question_model.dart';
import 'dart:convert';

class DBconnect {
  // let's first create a function to add a question to our database.
  // declare the name of the tavle you want to create and add .json as suffix
  final url = Uri.parse(
    'https://https://https://smartprepquizapp-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async  {
    http.post(url, 
    body: json.encode({
      'title': question.title,
      'options': question.options,
      }));
  }

// fetch the data from database
Future<void> featchQuestions() async {
  // we got the data from just using this. now let's print it to see what we got.
  http.get(url).then((response) {
    // the 'then' method returns a 'response' which is our data.
    // to whats inside we have to decode it first
    var data = json.decode(response.body);
    print(data);
  });
 } 
}