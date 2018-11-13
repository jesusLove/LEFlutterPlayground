import 'package:flutter/material.dart';

// 引入动画库
import 'package:flutter/animation.dart';


class AnimationScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('动画示例一'),
      ),
      body: new AnimationScreenBody(),
    );
  }
}

class AnimationScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimationScreenBodyState();
  }
}
// 逐渐放大Logo的形式显示图片
class AnimationScreenBodyState extends State<AnimationScreenBody> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    // 创建一个Controller
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);

    // ..是使用animation来调用addListener()
    // 等价于animation.addListener()
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener((){
      setState(() {

      });
    });
    // 启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();//释放控制器防止内存泄露
    super.dispose();
  }
}