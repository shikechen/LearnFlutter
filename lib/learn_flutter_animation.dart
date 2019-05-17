import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter animation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),);
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
        title: Text('Flutter animation'),
      ),
      body: ScaleAnimationRoute(),
    );
  }
}

//class ScaleAnimationRoute extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {

//    return _ScaleAnimationRouteState();
//  }
//}
//
//class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {
//  Animation<double> animation;
//  AnimationController controller;
//
//  @override
//  void initState() {
//    super.initState();
//    controller = new AnimationController(duration: Duration(seconds: 3), vsync: this);
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)..addListener(() {setState(() => {});});
//    controller.forward();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(child: Image.asset('images/dream_lake_colorado.png', width: animation.value, height: animation.value,),);
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//}


class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        'images/dream_lake_colorado.png',
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationRouteState();
  }
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
//    controller = new AnimationController(duration: Duration(seconds: 3), vsync: this);
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
//    controller.forward();
    controller = new AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //return AnimatedImage(animation: animation,);
//    return AnimatedBuilder(
//        animation: animation,
//        child: Image.asset('images/dream_lake_colorado.png'),
//        builder: (BuildContext ctx, Widget child) {
//          return Center(
//            child: Container(
//              width: animation.value,
//              height: animation.value,
//              child: child,
//            ),
//          );
//    });
      return GrowTransition(
        child: Image.asset('images/dream_lake_colorado.png'),
        animation: animation,
      );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Container(
              width: animation.value,
              height: animation.value,
              child: child,
            );
          },
          child: child,
      ),
    );
  }
}
