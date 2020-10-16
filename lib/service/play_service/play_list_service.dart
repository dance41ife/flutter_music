import 'package:flutter_shop/entity/music_list_structure.dart';
import 'package:flutter_shop/utils/share_preferences_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayListService{
  List<MusicListItem> _playList;
  int currIndex;
//  SharedPreferences spInstance;
//
//  Future<SharedPreferences> getPrefs() async {
//    spInstance = await SharedPreferences.getInstance();
//    return spInstance;
//  }
  // 工厂模式
  factory PlayListService() =>_getInstance();
  static PlayListService get instance => _getInstance();
  List<MusicListItem> get playList => this._playList;
  static PlayListService _instance;

  SharedPreferences spf;

  PlayListService._internal() {
    // 初始化
    _playList = [];

  }

  static PlayListService _getInstance() {
    if (_instance == null) {
      _instance = new PlayListService._internal();
    }
    return _instance;
  }

  void addToPlayList(MusicListItem item){
    _playList.add(item);
  }

  MusicListItem replacePlayList(List<MusicListItem> list,int index){
    _playList = list;
    currIndex = index;
    return _playList.elementAt(index);
  }

  MusicListItem getNextSong(){
    currIndex = currIndex>=_playList.length ? 0 :currIndex+1;
    return _playList.elementAt(currIndex);
  }

  MusicListItem getPreviousSong(){
    currIndex = currIndex <=0 ? _playList.length - 1 :currIndex-1;
    return _playList.elementAt(currIndex);
  }


}