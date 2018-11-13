import 'package:flutter/material.dart';

import 'package:flutter_animation_tutorial/tween/Animation1.dart';
import 'package:flutter_animation_tutorial/tween/Animation2.dart';
import 'package:flutter_animation_tutorial/tween/Animation3.dart';
import 'package:flutter_animation_tutorial/tween/Animation4.dart';
import 'package:flutter_animation_tutorial/tween/Animation5.dart';

class TweenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Tween动画示例'),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new AnimationScreen1())
              );
            },
            title: new Text('实例一'),
            subtitle: new Text('一个简单的动画示例'),
          ),
          new Divider(
            color: Colors.grey[300],
          ),
          new ListTile(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new AnimationScreen2())
              );
            },
            title: new Text('示例二'),
            subtitle: new Text('使用AnimatedWidget简化动画'),
          ),
          new Divider(
            color: Colors.grey[300],
          ),
          new ListTile(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new AnimationScreen3())
              );
            },
            title: new Text('示例三'),
            subtitle: new Text('监听动画状态，animation.addStatusListener()'),
          ),
          new Divider(
            color: Colors.grey[300],
          ),
          new ListTile(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new AnimationScreen4())
              );
            },
            title: new Text('示例四'),
            subtitle: new Text('使用AnimatedBuilder重构，实现责任分离'),
          ),
          new Divider(
            color: Colors.grey[300],
          ),
          new ListTile(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new AnimationScreen5())
              );
            },
            title: new Text('示例五'),
            subtitle: new Text('并行执行多个动画'),
          )
        ],
      ),
    );
  }
}