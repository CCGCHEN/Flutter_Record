import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/base/page_base.dart';

class PageLifeCycle extends AbstractPage {
  final int initValue;
  PageLifeCycle({this.initValue: 0});

  @override
  State<StatefulWidget> createState() {
    return _PageLifeCycleState();
  }
}

class _PageLifeCycleState extends State<PageLifeCycle> {
    int _counter;
    @override
    void initState() {
      super.initState();
      //初始化状态
      initData();
      print("PageLifeCycle initState");
    }

    @override
    Widget build(BuildContext context) {
      print("PageLifeCycle build");
      return Scaffold(
        body: Center(
          child: FlatButton(
            child: Text('$_counter'),
            //点击后计数器自增
            onPressed:()=>setState(()=> ++_counter,
            ),
          ),
        ),
      );
    }

    @override
    void didUpdateWidget(PageLifeCycle oldWidget) {
      super.didUpdateWidget(oldWidget);
      print("PageLifeCycle didUpdateWidget");
    }

    @override
    void deactivate() {
      super.deactivate();
      print("PageLifeCycle deactive");
    }

    @override
    void dispose() {
      super.dispose();
      print("PageLifeCycle dispose");
    }

    @override
    void reassemble() {
      super.reassemble();
      print("PageLifeCycle reassemble");
    }

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      print("PageLifeCycle didChangeDependencies");
    }


    void initData() async {
      print("PageLifeCycle initData");
      _counter = await widget.initValue;
    }
}