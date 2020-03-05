import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// => Arrow notation is for one line methods

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      //Scaffold provide AppBar and Body property
      home: RandomWordList()

    );
  }
}

//So for Stateful widget(whose state can be changed) we need 2 classes
//1st is StatefulWidget class to create an instance
//2nd is State class which persists over lifetime

/*class RandomWordState extends State{
  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }

}

class RandomWord extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RandomWordState();
  }

}*/

class RandomWordListState extends State{

  // _wordList means this date type is private
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 17.0);


  // #docregion _buildSuggestions
  Widget _buildSuggestions() {

    _suggestions.addAll(generateWordPairs().take(20));
    return ListView.builder(
        padding: const EdgeInsets.all(5.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 3;

          //For unlimited list
          /*if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(20)); *//*4*//*
          }*/


          //if(index>=_suggestions.length)return Divider();
            return _buildRow(_suggestions[index]);
        });
  }
  // #enddocregion  _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: _buildSuggestions(),
    );
  }

}


class RandomWordList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordListState();
  }

}