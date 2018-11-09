import 'package:flutter/material.dart';

void main() => runApp(new UIApp());

class UIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 文本列
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child:
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                )

              ],
            )
          ),
          new FavoriteWidget(),
        ],
      ),
    );

    // 创建
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE")
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        将文本放入容器中，以便沿每条边添加32像素的填充。softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开。
        ''',
        softWrap: true,
      ),
    );

    Widget box(Color color) {
      return new Container(
          height: 50,
          width: 50,
          color: color
      );
    }
    Widget headerTitle(String title) {
      return new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Divider(
              color: Colors.grey,
            ),
            new Text(
              title,
              style: new TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      );
    }

    return new MaterialApp(
      title: 'Flutter UI Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter UI Demo'),
        ),
        body: new ListView(
          children: <Widget>[
            titleSection,
            buttonSection,
            textSection,

            headerTitle('Row使用'),
            new Container(
              margin: EdgeInsets.all(10),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  box(Colors.red),
                  box(Colors.green),
                  box(Colors.blue)
                ],
              ),
            ),
            new Container(
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  box(Colors.red),
                  box(Colors.green),
                  box(Colors.blue)
                ],
              ),
            ),

            headerTitle('Column使用'),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                box(Colors.red),
                box(Colors.green),
                box(Colors.blue)
              ],
            ),
            headerTitle('MainAxisSize'),
            new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.star, color: Colors.green[500]),
                new Icon(Icons.star, color: Colors.green[500]),
                new Icon(Icons.star, color: Colors.green[500]),
                new Icon(Icons.star, color: Colors.black),
                new Icon(Icons.star, color: Colors.black),
              ],
            ),
            headerTitle('Expanded按比例划分'),
            new Container(
              margin: EdgeInsets.all(10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Expanded(child:
                  new Column(
                    children: <Widget>[
                      new Text('Staawberry Paviova',
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      new Text(
                        '''
                        行和列是水平和垂直布局的基本、低级widget - 这些低级widget允许最大化的自定义。Flutter还提供专门的，更高级别的wi局widget。
                        ''',
                        softWrap: true,
                      ),
                      buttonSection,
                    ],
                  ),
                    flex: 2,
                  ),
                  new Expanded(child:
                  new Container(
                      child: new Image.network('https://raw.githubusercontent.com/jesusLove/Owenli_Blog/master/Content/images/BGImages/skyColor1.jpg')
                  ),
                    flex: 3,
                  )
                ],
              ),
              decoration: new BoxDecoration(
                color: Colors.red,
                border: new Border.all(
                  width: 10.0,
                  color: Colors.green
                ),
              ),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Expanded(child: box(Colors.red)),
                new Expanded(child: box(Colors.green), flex: 2),
                new Expanded(child: box(Colors.blue), flex: 3,)

              ],
            ),
            headerTitle('子Widget处理状态'),
            new TapBoxA(), // 子Widget处理事件
            headerTitle('父Widget处理状态'),
            new ParentWidget(),// 父Widget处理事件
            headerTitle('子父Widget处理状态'),
            new ParentCWidget(), // 子父Widget共同处理事件
          ],
        ),
      ),
    );
  }
}

/*
* 添加点击事件，star
*
* */
class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteWidgetState();
  }
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite () {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child:
            new IconButton(
              icon:
                (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
              color: Colors.red,
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
              child: new Text('$_favoriteCount')
          ),
        ),
      ],
    );
  }

}

/*
* 子Widget管理自己的状态
* */
class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapBoxAState();
  }
}
class _TapBoxAState extends State<TapBoxA> {
  bool _active = true;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style:  new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

/*
* 由父Widget管理状态
* */

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  new _ParentWidgetState();
  }
}
class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child:new TapBoxB(onChanged: _handleTapboxChanged, active: _active,)
    );
  }
}
class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged}): super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child:  new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


/*
*   混合管理
* */

class ParentCWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentCWidgetState();
  }
}
class _ParentCWidgetState extends State<ParentCWidget> {
  bool _active = true;
  void _handleTapBoxChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapBoxCWidget(onChanged: _handleTapBoxChange, active: _active),
    );
  }
}

class TapBoxCWidget extends StatefulWidget {
  TapBoxCWidget({Key key, this.active: false, @required this.onChanged}): super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapBoxCWidgetState();
  }
}
class _TapBoxCWidgetState extends State<TapBoxCWidget> {
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap() {
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active': 'Inactive',
          style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(
            color: Colors.teal[700],
            width: 10.0
          ): null,
        ),
      ),
    );
  }
}