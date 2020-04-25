import 'package:flutter/material.dart';
import 'package:flutter_widget/padding_widget.dart';
import 'package:flutter_widget/page/page_gridview.dart';

import 'round_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.red,
        child: GridViewImage(),
      ),
    );
  }
}
