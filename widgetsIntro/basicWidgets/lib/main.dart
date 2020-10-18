// no spaces for package when importing
import 'package:flutter/material.dart';

void main() {
  runApp(
      // run if Material Designs used to properly display/inherit theme data
      MaterialApp(
    title: 'My app',
    home: MyScaffold(),
  ));
}

// Creates a Container for the Navigation Bar
class MyAppBar extends StatelessWidget {
  // pass args/params
  MyAppBar({this.title});

  // Fields in a Widget subclass are always marked "final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is horizontal linear layout
      child: Row(
        // <Widget> = type of items in the list
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null = disables button
          ),
          // Expanded expands its child to fill available space
          // Fills remaining available space not consumed by other children components
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

// Organizes the children in a vertical column
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material conceptual canvas where UI appears
    return Material(
      // Column is vertical, linear layout
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example Title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Check it'),
            ),
          ),
          MyAppBar(
            title: Text(
              'Test Bottom Bar?',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}

/* Hello World Sample */
// void main() {
//   // root of widget tree
//   runApp(
//     // 2 widgets, Center & Text
//     // Center = root widget = covers whole screen
//     Center(
//       child: Text(
//         'Hello World',
//         textDirection: TextDirection.ltr,
//       ),
//     ),
//   );
// }
