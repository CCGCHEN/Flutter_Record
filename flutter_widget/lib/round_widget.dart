
import 'package:flutter/material.dart';

class RoundImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://chufang1.cdn.3gsou.com/Upload/image/0130/shyl10130/dz4nwzs3qr3.jpg";
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(imageUrl),
            ),

            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                child: Image.network(imageUrl, width: 100, height: 100,),
              ),
            ),

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage('https://chufang1.cdn.3gsou.com/Upload/image/0130/shyl10130/dz4nwzs3qr3.jpg'),
                      fit: BoxFit.cover
                  )
              )
            ),
          ],
        ),
      );
  }

}