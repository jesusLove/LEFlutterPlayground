import 'package:flutter/material.dart';

import 'package:flutter_tutorials/SecondScreen.dart';
import 'package:flutter_tutorials/shoppingList.dart';
import 'todo/todo.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
          leading: new IconButton(icon: new Icon(Icons.menu), onPressed:() {
            Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new SecondScreen())
            );
          }, tooltip: 'Menu'),
          actions: <Widget>[
            new IconButton(onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new ShopingScreen())
              );
            },
              icon: new Icon(Icons.pages),)
          ],
        ),
        body: new HomeListView()
    );
  }
}
class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new ListTile(
          title: new Text('ToDo Demo'),
          subtitle: new Text('Todo列表，点击进入详情页，传递数据'),
          onTap: () {
            Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new ToDoScreen()),
            );
          },
        ),
        new ListTile(
          title: new Text('商品列表'),
          subtitle: new Text('点击删除，添加删除线'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new ShopingScreen())
            );
          },
        ),
        new ListTile(
          title: new Text('从下一页携带值返回'),
          onTap: () {
            _navigateAndDisplaySelection(context);
          },
        )
      ],
    );
  }
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new SecondScreen())
    );
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$result')));
  }
}

// 事件流是向上传递的，状态流式向下传递的

/*处理显示*/
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Text('Count: $count', textAlign: TextAlign.center),
    );
  }
}
/*
* 添加Button
* */
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed, this.title});

  final VoidCallback onPressed;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: onPressed,
      child: title,
    );
  }
}

/*合并*/
class Counter extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter ++;
    });
  }
  void _decrement() {
    setState(() {
      _counter --;
    });
  }
  @override
  Widget build(BuildContext context) {
  return new Row(
    children: <Widget>[
      new CounterIncrementor(onPressed: _increment, title: new Text('+')),
      new CounterDisplay(count: _counter),
      new CounterIncrementor(onPressed: _decrement, title: new Text('-')),
    ],
  );
  }
}


void main() => runApp(new HomeApp());



