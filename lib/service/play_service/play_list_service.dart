import 'package:flutter_shop/entity/music_list_structure.dart';

class PlayListService{
  List<MusicList> _playList = [];


  void addToPlayList(MusicList item){
    _playList.add(item);
  }

  List getPlayList(){
    return _playList;
  }

  void replacePlayList(List<MusicList> list){
    _playList = list;
  }
}