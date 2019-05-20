import 'package:flutter/material.dart';

/*
Created by shikechen on 2019/5/20
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter stagger animation',
      theme: ThemeData(primarySwatch: Colors.blue),
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
        title: Text('Stagger animation'),
      ),
      body: StaggerAnimationRoute(),
    );
  }
}

class StaggerAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StageerAnimationRouteState();
  }
}

class _StageerAnimationRouteState extends State<StaggerAnimationRoute> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: 2000
        )
    );
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel; // 先正向执行动画

      await _controller.reverse().orCancel; // 再反向执行动画
    } on TickerCanceled {

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
        },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          child: StaggerAnimation( // 自定义的交错动画widget
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(
        begin: .0, end: 300.0)
        .animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.0, 0.6, // 前60%的动画时间
                curve: Curves.ease
            ),
        ),
    );

    color = ColorTween(
        begin: Colors.green,
        end: Colors.red)
        .animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.0, 0.6,
                curve: Curves.ease
            ),
        ),
    );

    padding = Tween<EdgeInsets>(
        begin: EdgeInsets.only(left: .0),
        end: EdgeInsets.only(left: 100.0))
        .animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.6, 1.0, // 后40%的动画时间
                curve: Curves.ease
            ),
        ),
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation,
    );
  }
}
