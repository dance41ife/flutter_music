import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/home_data_struc.dart';
import 'package:flutter_shop/entity/music_list_structure.dart';
import 'package:flutter_shop/service/http_service/service_mock.dart';
import 'package:flutter_shop/service/play_service/play_list_service.dart';
import 'package:flutter_shop/service/play_service/player_service.dart';
import 'package:flutter_shop/utils/share_preferences_util.dart';
import 'package:flutter_shop/widget/home/swiper_widget.dart';
import 'package:flutter_shop/widget/music/bottom_play_widget.dart';
import 'package:flutter_shop/widget/music/song_list_item.dart';
import 'package:flutter_shop/widget/music/user_grid_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../service/http_service/service_method.dart';
import '../widget/music_anime/music_player_container.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";

  //OverlayEntry _overlayEntry;
//  MusicPlayerContainer _musicPlayerContainer = new MusicPlayerContainer(20, 20);
//  bool _isPlay = false;

  //AudioPlayer player;
  //List<MusicListItem> playList;
//  OverlayEntry _createOverlayEntry() {
//    return OverlayEntry(builder: (context) {
//      double screenHeight = MediaQuery.of(context).size.height;
//      double screenWidth = MediaQuery.of(context).size.width;
//      return FutureBuilder(
//        future: getPrefs(),
//        builder: (context, result) {
//          if (result.hasData){
//            SharedPreferences prefs = result.data;
//            var temp = prefs.getStringList("curr_music");
//          }
//          return Positioned(
//            left: 0,
//            top: screenHeight - 50,
//            child: Opacity(
//              opacity: 1,
//              child: Container(
//                  color: Colors.white,
//                  child: Container(
//                    height: 50,
//                    width: screenWidth,
//                    padding: EdgeInsets.only(top: 7, left: 7),
//                    child: Row(
//                      children: <Widget>[
//                        Column(
//                          children: [_musicPlayerContainer],
//                        ),
//                        Container(
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              Row(
//                                children: [
//                                  Text(
//                                    'should be music name',
//                                    style: TextStyle(fontSize: 12),
//                                  ),
//                                ],
//                              )
//                            ],
//                          ),
//                        ),
//                        Container(
//                          padding: EdgeInsets.only(left: 30),
//                          child: Row(
//                            children: [
//                              Material(
//                                child: IconButton(
//                                  icon: new Icon(
//                                    Icons.skip_previous,
//                                    size: 30,
//                                    color: Colors.black,
//                                  ),
//                                  onPressed: () {
//                                    print("previous music");
//                                  },
//                                ),
//                              ),
//                              Material(
//                                  child: IconButton(
//                                onPressed: () {
//                                  if (_isPlay) {
//                                    //_musicPlayerContainer.stopAnimation();
//                                    player.pause();
//                                  } else {
//                                    //_musicPlayerContainer.startAnimation();
//                                    print("ready play "+MockMusicUrl);
//                                    player.play(MockMusicUrl);
//                                    //
//                                  }
//                                  this.setState(() {
//                                    _isPlay = !_isPlay;
//                                  });
//                                },
//                                icon: new Icon(
//                                    _isPlay ? Icons.stop : Icons.play_arrow,
//                                    size: 30,
//                                    color: Colors.black),
//                              )),
//                              Material(
//                                  child: IconButton(
//                                icon: new Icon(Icons.skip_next,
//                                    size: 30, color: Colors.black),
//                                onPressed: () {
//                                  print("next music");
//                                },
//                              )),
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
//                  )),
//            ),
//          );
//        },
//      );
//    });
//  }

  @override
  void initState() {
    getHomePageContent();
//    player = Player.instance.player;
//    playList = PlayListService.instance.playList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // setState 仅触发build，所以overlay必须在这里初始化以便于setState后重新构建overlay
    // 否则overlay无法进行视图的更改
    // 注意由于每次触发build都会重新构建overlay因此有些组件状态不是连续的

//    _overlayEntry = _createOverlayEntry();
//    WidgetsBinding.instance
//        .addPostFrameCallback((_) => Overlay.of(context).insert(_overlayEntry));


    return Scaffold(
        appBar: AppBar(
            title: Container(
          child: Row(
            children: <Widget>[
              Text('AcGn Music +'),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/search",
                  );
                },
                padding: EdgeInsets.only(left: 200),
                icon: new Icon(Icons.search, size: 30, color: Colors.white),
              ),
            ],
          ),
        )),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = HomeDataStructure.fromJson(
                  json.decode(snapshot.data.toString()));
              List swiper = data.msgValue.swiperDataList;
              List<TopNaviDataList> navigatorList =
                  data.msgValue.topNaviDataList.cast();
              List<MyMusicList> myMusicList = data.msgValue.myMusicList.cast();

              return Container(
                //padding: EdgeInsets.only(bottom: 50),
                child:Stack(
                  children: <Widget>[
                    CustomScrollView(
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
                              return Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text("我的歌单"),
                                      Icon(CupertinoIcons.add)
                                    ],
                                  ));
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
                  BottomPlayWidget()
                  ],
                ),
                    //BottomPlayWidget()
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
