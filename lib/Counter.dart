import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Learn StatefulWidget',
    home: new Counter(),
  ));
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text('Count: $count');
  }
}

class CounterIncrementer extends StatelessWidget {
  CounterIncrementer({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      onPressed: onPressed,
        child: new Text('Increment')
    );
  }
}

class Counter extends StatefulWidget {

  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
//        new RaisedButton(
//          onPressed: _increment,
//          child: new Text('Increment'),
//        ),
//        new Text('Counter: $_counter'),
        new CounterIncrementer(onPressed: _increment),
        new CounterDisplay(count: _counter)
      ],
    );
  }
}