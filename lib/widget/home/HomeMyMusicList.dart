import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entities/MyMusicListItemData.dart';
class HomeMyMusicList extends StatelessWidget {
  final List myMusicList;
  HomeMyMusicList({Key key,this.myMusicList}) :super(key:key);

  Widget _getListItem(BuildContext context,index){
    print("===============================>myMusicList:index->"+index.toString()+",list_pic_url->"+myMusicList[index]["list_pic_url"].toString());
    return
      InkWell(
      onTap: (){
        Navigator.pushNamed(context, "/music_page",arguments: myMusicList[index]["list_name"].toString());
      },
      child:Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Image.network(
                myMusicList[index]["list_pic_url"].toString(),
                width: ScreenUtil().setWidth(95)
            ),
            Text(myMusicList[index]["list_name"].toString())
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

//     return SingleChildScrollView(
//        child: ListView.builder(
//          shrinkWrap: true,//设置高度自适应
//          //physics: NeverScrollableScrollPhysics(),//不允许滚动
//          itemBuilder: (BuildContext context, int index) => _getListItem(context,index),
//          itemCount: myMusicList.length,
//        ),
//      );
//      ListView.builder(
//        shrinkWrap: true,//设置高度自适应
//        //physics: NeverScrollableScrollPhysics(),//不允许滚动
//        itemBuilder: (BuildContext context, int index) => _getListItem(context,index),
//        itemCount: myMusicList.length,
//      );
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,//设置高度自适应
        //physics: NeverScrollableScrollPhysics(),//不允许滚动
        itemBuilder: (BuildContext context, int index) => _getListItem(context,index),
        itemCount: myMusicList.length,
      ),
    );
  }
}
