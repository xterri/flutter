import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial - Material',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold = layout for major Material Components
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation Menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body = majority of the screen
      body: Center(
        child: Row(
          children: <Widget>[
            Button(),
            Text("Don't Press the Button"),
            Counter(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

// Handling Gestures
class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // appears in console when pressed/tapped
        print('Button tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Press Me'),
        ),
      ),
    );
  }
}

// Stateful Widgets - Changing widgets in response to input

// use "stful" shortcut to create Stateful Widget templates
class Counter extends StatefulWidget {
  // this class = configuration for state
  // holds the values given by parent and used to build method of State
  // Fields in Widget subcass are always marked "final" ?

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // call setState to tell Flutter framework smth has changed
      // this call causes framework to rerun the build method to reflect updated values
      // if _counter change w/o call to setState() = build method won't rerun, updates don't change
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: Text('Add more'),
        ),
        Text('Count: $_counter'),
      ],
    );
  }
}
