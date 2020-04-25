import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              '第一列',
              style: TextStyle(decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.green,
            child: Text(
              '第二列',
              style: TextStyle(decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }

}