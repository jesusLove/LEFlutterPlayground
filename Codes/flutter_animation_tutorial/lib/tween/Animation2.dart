import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('使用AnimatedWidget简化'),
      ),
      body: new _AnimationScreen2Body(),
    );
  }
}
class _AnimationScreen2Body extends StatefulWidget {
  _AnimationScreen2Body({Key key}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AnimationScreen2BodyState();
  }
}

class _AnimationScreen2BodyState extends State<_AnimationScreen2Body> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    // 创建一个Controller
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    // 注意和示例一不同的是，AnimatedWidget自动调用addListener()和setState()方法。
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    // 启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new _AnimateLogo(animation: animation);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class _AnimateLogo extends AnimatedWidget {
  _AnimateLogo({Key key, Animation<double> animation}):super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }
}

