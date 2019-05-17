import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter hero animation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter hero animation'),
      ),
      body: HeroAnimationRoute(),
    );
  }
}

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
            tag: 'avatar', 
            child: ClipOval(
              child: Image.asset('images/dream_lake_colorado.png', width: 200.0,),
            ),
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(title: Text('原图'),),
                    body: HeroAnimationRouteB(),
                  ),
                );
              })
          );
          },
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Hero(
          tag: 'avatar',
          child: Image.asset('images/dream_lake_colorado.png'),
      ),
    );
  }
}
