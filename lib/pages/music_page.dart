import 'dart:convert';

import 'package:flutter/material.dart';
import '../service/http_service/service_method.dart';
import 'package:flutter_shop/widget/music/music_list_widget.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String postParam = ModalRoute
        .of(context)
        .settings
        .arguments;


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
                var data = json.decode(snapshot.data.toString());
                var list = (data['msgValue']['musicList'] as List).cast();

                return Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: <Widget>[
                      MusicListWidget(musicList: list),
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
  }
}
