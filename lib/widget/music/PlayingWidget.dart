import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/widget/music_Anime/musicPlayerContainer.dart';
class PlayingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new NetworkImage(serviceUrl+"/download?PathParam=/music_background.jpg"),//放音乐封面url
                  fit:BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                    Colors.black54,
                    BlendMode.overlay,
                  )
              )
          ),
        ),
        new Container(
            child: new BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
              child: Opacity(
                opacity: 0.6,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
        ),
        new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              child:
                Text("Sparks fly",textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.white,fontSize: 18,
                  ),
                ),
            ),
            MusicPlayerContainer(80,80),
          ],
        )
      ],
    );
  }
}
