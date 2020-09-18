import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeBanner extends StatelessWidget {
  final String bannerPicUrl;
  HomeBanner({Key key,this.bannerPicUrl}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Text("我的歌单"),
          Icon(CupertinoIcons.add)
        ],
      )
    );
  }
}
