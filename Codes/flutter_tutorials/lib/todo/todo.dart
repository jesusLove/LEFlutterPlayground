import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todos'),
      ),
      body: new TodoList(
        todos: new List.generate(20, (i) => new Todo(
          'Todo $i',
          'A description of whate need $i',
        ))),
      );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  TodoList({Key key, @required this.todos}): super(key: key);

  @override
    Widget build(BuildContext context) {
      return new ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(todos[index].title),
            // 跳转到详情页
            onTap: () {
              Navigator.push(context, 
                new MaterialPageRoute(
                  builder: (context) => new TodoDetailScreen(todo: todos[index],)
                )
              );
            },
          );
        },      
      );
    }
}

class TodoDetailScreen extends StatelessWidget {
  // 接收列表页的传值
  final Todo todo;
  TodoDetailScreen({Key key, @required this.todo}): super(key: key);
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('${todo.title}'),
        ),
        body: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Text('${todo.description}'),
        ),
      );
    }
}