
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget songListItem(BuildContext context, index, List myMusicList) {
  return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/music_page",
            arguments: myMusicList[index]["list_name"].toString());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Image.network(myMusicList[index]["list_pic_url"].toString(),
                width: ScreenUtil().setWidth(95)),
            Text(myMusicList[index]["list_name"].toString())
          ],
        ),
      ));
}