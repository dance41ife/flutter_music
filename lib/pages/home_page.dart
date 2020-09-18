import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/entities/MyMusicListItemData.dart';
import 'package:flutter_shop/widget/home/SwiperDiy.dart';
import 'file:///D:/work/workspace/flutter_shop/lib/widget/home/HomeBanner.dart';
import 'file:///D:/work/workspace/flutter_shop/lib/widget/home/HomeMyMusicList.dart';
import 'file:///D:/work/workspace/flutter_shop/lib/widget/home/TopNavigator.dart';
import 'dart:convert';
import '../service/service_method.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";


  @override
  void initState() {
    getHomePageContent().then(
            (value){
              setState(() {
                homePageContent = value.toString();
              });
            }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
          appBar: AppBar(
            title: Text('AcGn Music +'),
          ),
          body: FutureBuilder(
            future: getHomePageContent(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                print("=======================================>builder"+snapshot.data.toString());
                var data =   json.decode(snapshot.data.toString());
                List swiper = data['msgValue']['swiperDataList'];
                List navigatorList = (data['msgValue']['topNaviDataList'] as List).cast();
                String bannerPicUrl = (data['msgValue']['bannerPicUrl']);
                List myMusicList = (data['msgValue']['myMusicList'] as List).cast();
                return  Column(
                  children: <Widget>[
                    SwiperDiy(swiperDataList: swiper),
                    TopNavigator(navigatorList: navigatorList),
                    HomeBanner(),
                    HomeMyMusicList(myMusicList: myMusicList),
                    //HomeBanner(bannerPicUrl: bannerPicUrl,)
                  ],
                );
              }else{
                return Center(
                  child: Text('加载中...'),
                );
              }
            },
          )//异步请求专用渲染组件
      );

  }
}
