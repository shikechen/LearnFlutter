import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter basic widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Hello Flutter',
              textAlign: TextAlign.center,
            ),
//            Text('Hello Flutter 2019' * 8,
//              maxLines: 2,
//              overflow: TextOverflow.ellipsis,
//            ),
//            Text('Flutter' * 10,
//              textAlign: TextAlign.center,
//            ),
            Text('Hello Flutter',
              textScaleFactor: 2.0,
            ),
            Text('Hello Flutter',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: 'Courier',
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: 'Home: '
                ),
                TextSpan(
                  text: 'http://my.github.com',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ]
            )),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Hello Flutter'),
                  Text('I am GitHubber'),
                  Text('What about you?',
                    style: TextStyle(
                      inherit: false,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('RaisedButton'),
              onPressed: () => {},
            ),
            FlatButton(
              child: Text('FlatButton'),
              onPressed: () => {},
            ),
            OutlineButton(
              child: Text('OutlineButton'),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => {},
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('Submit'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            ),
            //Image(
            //  image: AssetImage('images/dream_lake_colorado.png'),
            //),
            //Image.asset('images/dream_lake_colorado.png'),
            TestSwitchAndCheckBoxRoute(),
          ],
        ),
      ),
    );
  }
}

class TestSwitchAndCheckBoxRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestSwitchAndCheckBoxState();
  }
}

class _TestSwitchAndCheckBoxState extends State<TestSwitchAndCheckBoxRoute> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}