import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/music_list_structure.dart';

class PlaySongsModel with ChangeNotifier{

  AudioPlayer _audioPlayer = AudioPlayer();

  List<MusicListItem> _songs = [];
  int curIndex = 0;
  Duration curSongDuration;

  bool  _isPlay = false;

  List<MusicListItem> get allSongs => _songs;
  MusicListItem get curSong => _songs[curIndex];

  bool get  isPlay => _isPlay;

  set isPlay(bool) => _isPlay = bool;



  // 播放一首歌
  void playSong(MusicListItem song) {
    _songs.insert(curIndex, song);
    play();
  }

  void playSongInList(List<MusicListItem> songs,int index){
    _songs = songs;
    curIndex = index;

    play();
  }

  // 添加歌曲
  void addSongs(List<MusicListItem> songs) {
    this._songs.addAll(songs);
  }

  /// 播放
  void play() {
    var url = this._songs[curIndex].musicUrl;
    _audioPlayer.play(url);
    saveCurSong();
  }

  /// 暂停
  void pausePlay() {
    _audioPlayer.pause();
  }


  /// 恢复播放
  void resumePlay() {
    _audioPlayer.resume();
  }

  /// 下一首
  void nextPlay(){
    if(curIndex >= _songs.length){
      curIndex = 0;
    }else{
      curIndex++;
    }
    play();
  }

  void prePlay(){
    if(curIndex <= 0){
      curIndex = _songs.length - 1;
    }else{
      curIndex--;
    }
    play();
  }

  // 保存当前歌曲到本地
  void saveCurSong(){

  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.release();
  }
}
