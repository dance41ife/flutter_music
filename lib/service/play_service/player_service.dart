import 'package:audioplayers/audioplayers.dart';
class Player{
  AudioPlayer _player;

  // 工厂模式
  factory Player() =>_getInstance();
  static Player get instance => _getInstance();
  get player => this._player;
  static Player _instance;
  Player._internal() {
    // 初始化
    _player = new AudioPlayer();

  }
  static Player _getInstance() {
    if (_instance == null) {
      _instance = new Player._internal();
    }
    return _instance;
  }


}