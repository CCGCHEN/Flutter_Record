import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 居中loading页面
 */
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('加载中...', style: new TextStyle(fontSize: 20.0, color: Colors.black54)),
      ),
    );
  }
}

/**
 * 居中错误页面
 */
class LoadErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('网络异常', style: new TextStyle(fontSize: 20.0, color: Colors.black54, wordSpacing: 30)),
        ],
      ),
    );
  }
}