import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StartUp Name Generator',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.pink,
      ),
      home: RandomWords(),
    );
  }
}

//stful = shortcut to stateful widget template
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  // 'Set' preferred b/c doesn't allow duplicate entries
  final _saved = Set<WordPair>();

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // add 1px high divider to visually separate entries
          if (i.isOdd) return Divider();
          // even rows = add ListtTile row

          // divide i by 2, calculate # of word pairings in ListView - dividers
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            // if @ end, generate 10 more and add to _suggestions
            _suggestions.addAll(generateWordPairs().take(10));
          }
          // called once per word pair; displays new pair in ListTile
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    // check if pair alrdy added
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () => {
        setState(() => {
              if (alreadySaved) {_saved.remove(pair)} else {_saved.add(pair)}
            })
      },
    );
  }

  void _pushSaved() {
    // Navigator adds "back" button to app bar, don't need to add Navigator.pop
    Navigator.of(context).push(
      // content for a new page
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          // get all saved pairs and save into array (tiles)
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );

          // add horizontal spacing between each tile/pair
          // convert to rows with "toList()"
          final divided = ListTile.divideTiles(
            tiles: tiles,
            context: context,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StartUp Name Generator'),
        // actions takes an array of widgets (children)
        // child takes a single widget
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
