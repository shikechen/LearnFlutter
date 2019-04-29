import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter layout',
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
        title: Text('Flutter layout'),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('TextTextText3'),
                      Text('TextTextText4'),
                    ],
                  ),
                ),
              )
//              Container(
//                color: Colors.red,
//                child: Column(
//                  mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[
//                    Text('TextTextText1'),
//                    Text('TextTextText2'),
//                  ],
//                ),
//              )
            ],
          ),),
      ),
    );
  }
}

//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Flutter layout'),
//      ),
//      body: Center(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('TextTextText1'),
//                Text('TextTextText2'),
//              ],
//            ),
//            Row(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('TextTextText3'),
//                Text('TextTextText4'),
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              textDirection: TextDirection.rtl,
//              children: <Widget>[
//                Text('TextTextText5'),
//                Text('TextTextText6'),
//              ],
//            ),
//            Row(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              verticalDirection: VerticalDirection.up,
//              children: <Widget>[
//                Text('TextTextText7', style: TextStyle(fontSize: 30.0),),
//                Text('TextTextText8'),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}