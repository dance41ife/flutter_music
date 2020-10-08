import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/music_list_structure.dart';

class MusicListWidget extends StatelessWidget {
  final List<MusicList> musicList;

  MusicListWidget({Key key, this.musicList}) : super(key: key);

  Widget _getListItem(BuildContext context, index) {
    print("===============================>musicList:index->" +
        index.toString() +
        ",${musicList[index].toString()}");
    return InkWell(
        onTap: () {
          print("on pressed");
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 6, color: Color.fromRGBO(244, 245, 245, 1.0)),),
            boxShadow: [
              BoxShadow(
                blurRadius: 2, //阴影范围
                spreadRadius: 1, //阴影浓度
                color: Colors.white, //阴影颜色
              )
            ]
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Text(
                musicList[index].musicName.toString(),
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true, //设置高度自适应
        //physics: NeverScrollableScrollPhysics(),//不允许滚动
        itemBuilder: (BuildContext context, int index) =>
            _getListItem(context, index),
        itemCount: musicList.length,
      ),
    );
  }
}
