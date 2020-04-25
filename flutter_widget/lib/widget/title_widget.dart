import 'package:flutter/material.dart';

typedef TapCallback = void Function();

class TextImgWidget extends StatelessWidget {

  final String text;
  final String imgUrl;
  final TapCallback tabCallBack;

  TextImgWidget(this.text,
    this.imgUrl, {  Key key, this.tabCallBack,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tabCallBack != null) {  tabCallBack();  }
      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Colors.grey,
              border: Border.all(color: Colors.grey, width: 0.5),borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(borderRadius: BorderRadius.circular(12),
              child: Image.network(imgUrl, width: 60.0, height: 60.0, fit: BoxFit.fill,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: Text(text, softWrap: false, overflow: TextOverflow.fade,
              style: TextStyle(fontSize: 13, color: Colors.black),),
          )
        ],
      ),
    );
  }
}
