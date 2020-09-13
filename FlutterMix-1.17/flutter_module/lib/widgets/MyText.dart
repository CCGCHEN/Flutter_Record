import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _MyStatefulWidgetState();
  }

  MyStatefulWidget(String title);
}

const String TAG = "MyStatefulWidget_LifeCycle";

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    log("build");
    return Container(width: 100, height: 100, color: Colors.blue,);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("didChangeDependencies");
  }

  log(String msg) {
    print(TAG + "msg is $msg");
  }

  @override
  void dispose() {
    super.dispose();
    log("dispose");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    log("deactivate");
  }

}