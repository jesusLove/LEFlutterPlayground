import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SecondScreen'),
      ),
      body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed: () {
              Navigator.pop(context, 'HHHHH');
            },
            child: new Text('返回'),
            ),
            new SelectionButton(),
          ],
     )
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(onPressed: () {
      _navigateAndDisplaySelection(context);
    }, 
    child: new Text('下一页'));
  }
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new SelectionScreen())
    );
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pick an option') ,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(8.0),
              child: new RaisedButton(onPressed: () {
                Navigator.pop(context, 'Yep!');
              },
              child: new Text('Yep!')),
            ),
          ],
        ),
      ),
    );
  }
}
