import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

/*
*
* animate3示例中的代码存在的一个问题： 更改动画需要更改显示logo的widget。更好的解决方案是将职责分离：
*   显示logo
*   定义Animation对象
*   渲染过渡效果
* 您可以借助AnimatedBuilder类完成此分离。AnimatedBuilder是渲染树中的一个独立的类。
* 与AnimatedWidget类似，AnimatedBuilder自动监听来自Animation对象的通知，
* 并根据需要将该控件树标记为脏(dirty)，因此不需要手动调用addListener()。
* */

class AnimationScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('使用AnimateBuilder重构'),
      ),
      body: new _AnimationScreen4Body(),
    );
  }
}

class _AnimationScreen4Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimationScreen4BodyState();
  }
}

class _AnimationScreen4BodyState extends State<_AnimationScreen4Body> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    final CurvedAnimation curved = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // 由于,animation是double类型的，所以这里需要有小数点，不添加小数点会报错。）
    animation = new Tween(begin: 0.0, end: 300.0).animate(curved);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new _GrowTransition(child: new _LogoWidget(), animation: animation);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// 定义过渡所需要的集合，创建AnimateBuilder，build函数创建并返回AnimatedBuilder，它将方法和LogoWidget对象作为参数。渲染的实际工作发生在匿名构建器中。
class _GrowTransition extends StatelessWidget {
  // 两个参数，被渲染对象
  final Widget child;
  // 渲染动画
  final Animation<double> animation;
  // 初始化方法
  _GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    // 外部将child传给builder,builder在传递给内部的匿名函数。
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          // 该匿名函数处理实际的渲染转换工作
          builder: (BuildContext context, Widget child) {
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child,
        ),
    );
  }
}
// 定义Logo的渲染代码
class _LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}
