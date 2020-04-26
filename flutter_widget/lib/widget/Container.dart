import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 45, left: 120),
      padding: EdgeInsets.all(20),

//      color: Colors.yellow,

      decoration: BoxDecoration(  //背景装饰
          color: Colors.yellow,
          gradient: RadialGradient( //渐变
            colors: [Colors.red, Colors.orange],
            center: Alignment.center,
            radius: .98,
          ),

          boxShadow: [  //卡片阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
            )
          ]
      ),

      transform: Matrix4.rotationZ(0.2),

      child: Text("520", style: TextStyle(color: Colors.white, fontSize: 40.0), ),
    );
  }

}