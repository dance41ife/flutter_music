import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/entity/music_list_structure.dart';
import 'package:flutter_shop/utils/share_preferences_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayListModel with ChangeNotifier{

  List<MusicListItem> _playList;
  int currIndex;

  void addToPlayList(MusicListItem item){
    _playList.add(item);
  }

  MusicListItem setPlayList(List<MusicListItem> list,int index){
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