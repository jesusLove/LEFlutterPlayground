import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class AnimationScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('监听动画过程'),
      ),
      body: new _AnimationScreen3Body(),
    );
  }
}

class _AnimationScreen3Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimationScreen3BodyState();
  }
}

class _AnimationScreen3BodyState extends State<_AnimationScreen3Body> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    // 使用addStatusListener监听动画状态
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
        ..addStatusListener((state){
          print('$state'); // 输出开始和结束状态。
          if (state == AnimationStatus.completed) {
            controller.reverse(); // 动画结束后反转
          } else if (state == AnimationStatus.dismissed) {
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
    controller.dispose(); // 防止内存泄露，可以可以注释后查看效果。
    super.dispose();
  }
}


class _AnimatedLogo extends AnimatedWidget {
  _AnimatedLogo({Key key, Animation<double> animation}): super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child:  new Container(
        child: new FlutterLogo(),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
      ),
    );
  }
}