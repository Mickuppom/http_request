import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_request/model/todo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];

  Future fatchTodo() async {
    http.Response request = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );
    setState(() {
      todos = (jsonDecode(request.body) as List)
          .map((json) => Todo.fromJson(json))
          .toList();
    });
  }

  @override
  void initState() {
    fatchTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cf-s3.petcoach.co/thumbnails/article/uploads/articles/363/bdd17f44166dbff74876fced4dc6c9d3ca06ad80.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cf-s3.petcoach.co/thumbnails/article/uploads/articles/363/bdd17f44166dbff74876fced4dc6c9d3ca06ad80.jpeg"),
                    ),
                    Text("Mickuppom"),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
              leading: Icon(Icons.photo),
              title: Text("Gallery"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Container(
        child: ListView(
          children: todos
              .map(
                (item) => Card(
                  child: ListTile(
                    title: Text(item.title),
                    subtitle:
                        item.completed ? Text("Completed") : Text("Incomplete"),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
