import 'package:flutter/material.dart';

import 'tween/TweenPage.dart';
import 'AnimationListSample.dart';

void main() => runApp(new LEApp());

class LEApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animation Tutorial',
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new TweenPage())
              );
            },
            title: new Text('Tween动画示例'),
            subtitle: new Text('补间动画的基本使用示例'),
          ),
          new Divider(
            color: Colors.grey[300],
          ),
          new ListTile(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new AnimatedListSample())
              );
            },
            title: new Text('AnimationList'),
            subtitle: new Text('补间动画的基本使用示例'),
          ),
        ],
      ),
    );
  }
}
