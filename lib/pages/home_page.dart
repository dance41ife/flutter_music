import 'package:flutter/material.dart';
import 'package:flutter_shop/widget/home/SwiperDiy.dart';
import 'package:flutter_shop/widget/music/song_list_item.dart';
import 'package:flutter_shop/widget/music/user_grid_item.dart';
import '../widget/home/HomeBanner.dart';
import 'dart:convert';
import '../service/service_method.dart';
import '../widget/music_anime/musicPlayerContainer.dart';

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
      bool isPlay = false;
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;
      return Positioned(
        left: 0,
        top: screenHeight - 50,
        child: Opacity(
          opacity: 1,
          child: Container(
              color: Colors.white,
              child: Container(
                height: 50,
                width: screenWidth,
                padding: EdgeInsets.only(top: 7, left: 7),
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
                              Text(
                                'should be music name',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Material(
                            child: IconButton(
                              icon: new Icon(
                                Icons.skip_previous,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                print("previous music");
                              },
                            ),
                          ),
                          Material(
                              child: IconButton(
                            onPressed: () {
                              this.setState(() {
                                isPlay = !isPlay;
                              });
                              if (isPlay) {
                                _musicPlayerContainer.stopAnimation();
                              } else {
                                _musicPlayerContainer.startAnimation();
                              }
                            },
                            icon: new Icon(
                                isPlay ? Icons.stop : Icons.play_arrow,
                                size: 30,
                                color: Colors.black),
                          )),
                          Material(
                              child: IconButton(
                            icon: new Icon(Icons.skip_next,
                                size: 30, color: Colors.black),
                            onPressed: () {
                              print("next music");
                            },
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
            title: Container(
          child: Column(
            children: <Widget>[
              Text('AcGn Music +'),
            ],
          ),
        )),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List swiper = data['msgValue']['swiperDataList'];
              List navigatorList =
                  (data['msgValue']['topNaviDataList'] as List).cast();
              List myMusicList =
                  (data['msgValue']['myMusicList'] as List).cast();
              return Container(
                padding: EdgeInsets.only(bottom: 50),
                child: CustomScrollView(
                  slivers: <Widget>[
                    // banner 部分
                    SliverFixedExtentList(
                      itemExtent: 100.0,
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return (SwiperDiy(swiperDataList: swiper));
                      }, childCount: 1),
                    ),
                    // 中间用户部分
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return (gridListItem(index, navigatorList));
                      }, childCount: navigatorList.length),
                    ),
                    // 我的歌单小widget，新增歌单用
                    SliverFixedExtentList(
                      itemExtent: 50.0,
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return (HomeBanner());
                      }, childCount: 1),
                    ),
                    //歌单列表
                    SliverFixedExtentList(
                      itemExtent: 70.0,
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return (songListItem(context, index, myMusicList));
                      }, childCount: myMusicList.length),
                    ),
                  ],
                ),
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
