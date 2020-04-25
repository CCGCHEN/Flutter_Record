import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 居中loading页面，使用了Material，不需要自己设置背景，有默认配置。
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
 * 没有使用Material组件,  如Scaffold.
 * 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色
 * 将背景色改为了白色，并且将文本颜色改为了灰色，
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

class LoadingPage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(color: Colors.white),
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(30),
              sliver: new SliverGrid(delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: new Container(
                        width: 60,
                        height: 60,
                        child: Icon(Icons.free_breakfast),
                      ),
                    );
                  }
              ), gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //Grid按两列显示
                mainAxisSpacing: 25.0,
                crossAxisSpacing: 25.0,
              ))
            ),
          ],
        ),
      ),
    );

  }
}