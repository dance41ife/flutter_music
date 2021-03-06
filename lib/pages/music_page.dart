import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/music_list_structure.dart';
import 'package:flutter_shop/provider/play_model.dart';
import 'package:flutter_shop/widget/music/bottom_play_widget.dart';
import 'package:provider/provider.dart';
import '../service/http_service/service_method.dart';
import 'package:flutter_shop/widget/music/music_list_widget.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String postParam = ModalRoute
        .of(context)
        .settings
        .arguments;
    return  Consumer<PlaySongsModel>(builder: (context,model,child){
      print('MusicPage-------------->');
      print(model);
      return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("歌单详情"),
        ),
        body: Container(
            child: FutureBuilder(
              future: getMusicListContent(postParam),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  var data = MusicList.fromJson(json.decode(snapshot.data.toString()));
                  var list = data.msgValue.musicList;

                  return Container(
                    child: Column(
                      children: <Widget>[
                        MusicListWidget(musicList: list),
                        BottomPlayWidget(model: model)
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text('加载中...'),
                  );
                }
              },
            )),
      );
    });
  }
}
