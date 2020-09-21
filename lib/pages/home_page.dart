import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/entities/MyMusicListItemData.dart';
import 'package:flutter_shop/widget/home/SwiperDiy.dart';
import '../widget/home/HomeBanner.dart';
import '../widget/home/HomeMyMusicList.dart';
import '../widget/home/TopNavigator.dart';
import 'dart:convert';
import '../service/service_method.dart';
import '../widget/music_Anime/musicPlayerContainer.dart';
import '../widget/music/PlayWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";

  OverlayEntry _overlayEntry;
  MusicPlayerContainer _musicPlayerContainer = new MusicPlayerContainer(20, 20);

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(builder: (context) {
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWeight = MediaQuery.of(context).size.width;

      return Positioned(
        left: 0,
        top: screenHeight - 50,
        child: Opacity(
          opacity: 1,
          child: Container(
              color: Colors.white,
              child: Container(
                height: 50,
                padding: EdgeInsets.only(top: 7,left: 7),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: [_musicPlayerContainer],
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('should be music name',
                                  style: TextStyle(fontSize: 15),),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding :EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Material(
                            child: IconButton(
                              icon: new Icon(
                                Icons.skip_previous,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Material(
                              child: IconButton(
                            icon: new Icon(Icons.play_arrow,
                                size: 30, color: Colors.black),
                            onPressed: () {},
                          )),
                          Material(
                              child: IconButton(
                            icon: new Icon(Icons.skip_next,
                                size: 30, color: Colors.black),
                            onPressed: () {},
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      );
    });
  }

  @override
  void initState() {
    getHomePageContent();
    _overlayEntry = _createOverlayEntry();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Overlay.of(context).insert(_overlayEntry));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AcGn Music +'),
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("=======================================>builder" +
                  snapshot.data.toString());
              var data = json.decode(snapshot.data.toString());
              List swiper = data['msgValue']['swiperDataList'];
              List navigatorList =
                  (data['msgValue']['topNaviDataList'] as List).cast();
              String bannerPicUrl = (data['msgValue']['bannerPicUrl']);
              List myMusicList =
                  (data['msgValue']['myMusicList'] as List).cast();
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiper),
                  TopNavigator(navigatorList: navigatorList),
                  HomeBanner(),
                  HomeMyMusicList(myMusicList: myMusicList),
                  //HomeBanner(bannerPicUrl: bannerPicUrl,)
                ],
              );
            } else {
              return Center(
                child: Text('加载中...'),
              );
            }
          },
        ) //异步请求专用渲染组件
        );
  }
}
