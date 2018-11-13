import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

//此示例展示了如何在同一个动画控制器上使用多个Tween，其中每个Tween管理动画中的不同效果。
//本示例仅用于示例，如果您在生产代码中需要使用不透明度和大小变化的Tween，
//则可能会使用FadeTransition和SizeTransition。

class AnimationScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('并行动画'),
      ),
      body: new _AnimationScreen5Body(),
    );
  }
}

class _AnimationScreen5Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimationScreen5BodyState();
  }
}


class _AnimationScreen5BodyState extends State<_AnimationScreen5Body> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

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
    return new _AnimatedLogo(animation: animation);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AnimatedLogo extends AnimatedWidget {
  // 透明度
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  // 大小
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);
  _AnimatedLogo({Key key, Animation<double> animation}):super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
        ),
      ),
    );
  }
}