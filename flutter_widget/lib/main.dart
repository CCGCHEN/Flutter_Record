import 'package:flutter/material.dart';
import 'package:flutter_widget/widget/Container.dart';
import 'package:flutter_widget/widget/GridView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter常用Widget使用'),),
        backgroundColor: Colors.blue,
        body: Container(
          color: Colors.yellow,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
