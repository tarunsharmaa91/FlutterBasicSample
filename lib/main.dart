import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// => Arrow notation is for one line methods

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Below is library to get random words
    WordPair wordPair = WordPair.random();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      //Scaffold provide AppBar and Body property
      home: Scaffold(appBar: AppBar(
        title: Text('Welcome')),

        //Here Center and Text is also widget
        body: Center(child: Text(wordPair.asPascalCase))
      )

    );
  }
}