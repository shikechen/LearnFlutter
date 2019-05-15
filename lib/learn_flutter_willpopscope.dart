import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'WillPopScope',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),);
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
    return TestThemeRoute();
  }
}

class TestWillPopScopeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWillPopScopeRouteState();
  }
}

class _TestWillPopScopeRouteState extends State<TestWillPopScopeRoute> {
  DateTime _lastPressedTime;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test WillPopScope'),
      ),
      body: WillPopScope(
          child: Container(
            alignment: Alignment.center,
            child: Text('Press the return key \ntwice in a row within 1 second to exit'),
          ),
          onWillPop: () async {
            if (_lastPressedTime == null || DateTime.now().difference(_lastPressedTime) > Duration(seconds: 1)) {
              _lastPressedTime = DateTime.now();
              return false;
            }
            return true;
          }),
    );
  }
}

class TestThemeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestThemeRouteState();
  }
}

class _TestThemeRouteState extends State<TestThemeRoute> {
  Color _themeColor = Colors.teal;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
            primarySwatch: _themeColor, 
            iconTheme: IconThemeData(color: _themeColor)), 
        child: Scaffold(
          appBar: AppBar(title: Text('Theme test'),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite), 
                  Icon(Icons.airport_shuttle),
                  Text('  color follows theme'),
                ],
              ),
              Theme(
                  data: themeData.copyWith(iconTheme: themeData.iconTheme.copyWith(color: Colors.black),), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: <Widget>[
                      Icon(Icons.favorite), 
                      Icon(Icons.airport_shuttle), 
                      Text('  Fixed black color'),
                    ],
                  ),
              ),
            ],
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(
                  () => _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal
          ),
          child: Icon(Icons.palette),
        ),
        ),
    );
  }
}
