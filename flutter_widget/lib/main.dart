import 'package:flutter/material.dart';
import 'package:flutter_widget/common_page.dart';
import 'package:flutter_widget/padding_widget.dart';

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
      home: PaddingWidget(),
    );
  }
}
