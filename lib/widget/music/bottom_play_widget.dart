import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/music_list_structure.dart';
import 'package:flutter_shop/provider/play_list_model.dart';
import 'package:flutter_shop/provider/play_model.dart';
import 'package:flutter_shop/service/http_service/service_mock.dart';
import 'package:flutter_shop/widget/music_anime/music_player_container.dart';
import 'package:provider/provider.dart';
class BottomPlayWidget extends StatefulWidget {
  @override
  _BottomPlayWidgetState createState() => _BottomPlayWidgetState();
}

class _BottomPlayWidgetState extends State<BottomPlayWidget> {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    MusicPlayerContainer _musicPlayerContainer = new MusicPlayerContainer(20, 20);


    return Consumer<PlaySongsModel>(builder: (context,model,child){
      return  Align(
        alignment: Alignment.bottomCenter,
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
                                  MusicListItem item = new MusicListItem();
                                  item.musicUrl = MockMusicUrl;
                                  model.playSong(item);
                                  this.setState(() {
                                    model.isPlay = !model.isPlay;
                                  });
                                },
                                icon: new Icon(
                                    model.isPlay ? Icons.stop : Icons.play_arrow,
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
}

//class BottomPlayWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    double screenHeight = MediaQuery.of(context).size.height;
//    double screenWidth = MediaQuery.of(context).size.width;
//    MusicPlayerContainer _musicPlayerContainer = new MusicPlayerContainer(20, 20);
//    bool _isPlay = false;
//
//    return Consumer<PlaySongsModel>(builder: (context,model,child){
//      return  Container(
//          child: Opacity(
//            opacity: 1,
//            child: Container(
//                color: Colors.white,
//                child: Container(
//                  height: 50,
//                  width: screenWidth,
//                  padding: EdgeInsets.only(top: 7, left: 7),
//                  child: Row(
//                    children: <Widget>[
//                      Column(
//                        children: [_musicPlayerContainer],
//                      ),
//                      Container(
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            Row(
//                              children: [
//                                Text(
//                                  'should be music name',
//                                  style: TextStyle(fontSize: 12),
//                                ),
//                              ],
//                            )
//                          ],
//                        ),
//                      ),
//                      Container(
//                        padding: EdgeInsets.only(left: 30),
//                        child: Row(
//                          children: [
//                            Material(
//                              child: IconButton(
//                                icon: new Icon(
//                                  Icons.skip_previous,
//                                  size: 30,
//                                  color: Colors.black,
//                                ),
//                                onPressed: () {
//                                  print("previous music");
//                                },
//                              ),
//                            ),
//                            Material(
//                                child: IconButton(
//                                  onPressed: () {
//                                    MusicListItem item = new MusicListItem();
//                                    item.musicUrl = MockMusicUrl;
//                                    model.playSong(item);
//                                    //_isPlay = !_isPlay;
//
//                                  this.setState(() {
//                                    _isPlay = !_isPlay;
//                                  });
//
//                                  },
//                                  icon: new Icon(
//                                      _isPlay ? Icons.stop : Icons.play_arrow,
//                                      size: 30,
//                                      color: Colors.black),
//                                )),
//                            Material(
//                                child: IconButton(
//                                  icon: new Icon(Icons.skip_next,
//                                      size: 30, color: Colors.black),
//                                  onPressed: () {
//                                    print("next music");
//                                  },
//                                )),
//                          ],
//                        ),
//                      )
//                    ],
//                  ),
//                )),
//          ),
//
//
//      );
//    });
//
//  }
//}
