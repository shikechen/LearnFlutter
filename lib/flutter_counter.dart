import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter counter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'new_page':(context) => NewRoute(),
        'echo_page':(context) => EchoRoute('I\'m an echo route page'),
        'cupertino_page':(context) => CupertinoRoute(),
      },
      home: new MyHomePage(
        title: 'Flutter Home Page'
      ),
      //showPerformanceOverlay: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('Open new route page'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, 'new_page');
//                Navigator.push(context, new MaterialPageRoute(builder: (context) {
//                  return new NewRoute();
//                }));
              },
            ),
            FlatButton(
              child: Text('Open echo route page'),
              textColor: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, 'echo_page');
              },
            ),
            FlatButton(
              child: Text('Open Cupertino route page'),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, 'cupertino_page');
              },
            ),
            new RandomWordsWidget(),
            new Echo(text: 'Hello Dart 2019/4/24'),
            new ShowImageWidget(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('New route page'),
      ),
      body: new Center(
        child: Text('This is a new route page'),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  EchoRoute(this.tip);
  final String tip;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Echo route'),
      ),
      body: Center(
        child: Text(tip),
      ),
    );
  }
}

class CupertinoRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Demo'),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text('Press'),
            onPressed: () {}
            ),
      ),
    );
  }
}

class Echo extends StatelessWidget {
  
  const Echo({Key key, @required this.text, this.backgroundColor: Colors.grey});
  
  final String text;
  final Color backgroundColor;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class ShowImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset('images/dream_lake_colorado.png');
//    return new DecoratedBox(
//        decoration: new BoxDecoration(
//            image: new DecorationImage(
//              image: new AssetImage('images/dream_lake_colorado.png'),
//            )
//        ),
//    );
  }
}