
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/home_data_struc.dart';


Widget gridListItem(index, List<TopNaviDataList> navigatorList) {
  return InkWell(
      onTap: () {
        print('点击导航');
      },
      child: Container(
        padding: EdgeInsets.only(top: 2),
        child: Column(
          children: <Widget>[
            Container(
                width: ScreenUtil().setWidth(95), //必须设置 否则NetWorkImage不显示
                height: ScreenUtil().setWidth(95), //必须设置 否则NetWorkImage不显示
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(navigatorList[index].url),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40)))),
            Text(navigatorList[index].itemName)
          ],
        ),
      ));
}