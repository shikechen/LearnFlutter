import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Gesture Detector',
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
    return _TestGestureConflictRoute();
  }
}

class TestGestureDetectorRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestGestureDetectorRouteState();
  }
}

class _TestGestureDetectorRouteState extends State<TestGestureDetectorRoute> {
  String _operation = 'No Gesture detected';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Gesture Detector'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation, style: TextStyle(color: Colors.white),),
          ),
          onTap: () => updateText('Tap'),
          onDoubleTap: () => updateText('DoubleTap'),
          onLongPress: () => updateText('LongPress'),
        ),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}

class _Drag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DragState();
  }
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Drag'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('D'),
                ),
                onPanDown: (DragDownDetails e) {
                  print('Press down ${e.globalPosition}');
                },
                onPanUpdate: (DragUpdateDetails e) {
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
                onPanEnd: (DragEndDetails e) {
                  print(e.velocity);
                },
              ),
          ),
        ],
      ),
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DragVerticalState();
  }
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag vertical'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: _top,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('D'),
                ),
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
              ),
          )
        ],
      ),
    );
  }
}

class _TestScaleRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestScaleRouteState();
  }
}

class _TestScaleRouteState extends State<_TestScaleRoute> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test scale'),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.asset('images/dream_lake_colorado.png', width: _width,),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _width = 200 * details.scale.clamp(.5, 10);
            });
            },
        ),
      ),
    );
  }
}

class _TestGestureRecognizerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestGestureRecognizerRouteState();
  }
}

class _TestGestureRecognizerRouteState extends State<_TestGestureRecognizerRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test GestureRecognizer'),
      ),
      body: Center(
        child: Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: 'Hello world'),
                  TextSpan(
                      text: 'Click to change color',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: _toggle ? Colors.blue : Colors.red,
                      ),
                      recognizer: _tapGestureRecognizer..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      }
                  ),
                  TextSpan(text: 'Hello Flutter'),
                ]
            )
        ),
      ),
    );
  }
}

class _TestBothDirectionRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestBothDirectionRouteState();
  }
}

class _TestBothDirectionRouteState extends State<_TestBothDirectionRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test both direction'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('A'),
                ),
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                  },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                  },
              ),
          )
        ],
      ),
    );
  }
}

class _TestGestureConflictRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestGestureConflictRouteState();
  }
}

class _TestGestureConflictRouteState extends State<_TestGestureConflictRoute> {
  double _left = 0.0;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test gesture conflict'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('A'),
                ),
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print('onHorizontalDragEnd');
                },
                onTapDown: (details) {
                  print('onTapDown');
                },
                onTapUp: (details) {
                  print('onTapUp');
                },
              ),
          )
        ],
      ),
    );
  }
}
