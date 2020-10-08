
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/home_data_struc.dart';


Widget songListItem(BuildContext context, index, List<MyMusicList> myMusicList) {
  return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/music_page",
            arguments: myMusicList[index].listName.toString());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Image.network(myMusicList[index].listPicUrl.toString(),
                width: ScreenUtil().setWidth(95)),
            Text(myMusicList[index].listName.toString())
          ],
        ),
      ));
}