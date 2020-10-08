class PlayListService{
  var _playList = [];


  void addToPlayList(item){
    _playList.add(item);
  }

  List getPlayList(){
    return _playList;
  }

  void replacePlayList(List list){
    _playList = list;
  }
}