import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Player extends StatefulWidget {
  /// [AudioPlayer] 播放地址
  final String audioUrl;

  /// 音量
  final double volume;

  /// 错误回调
  final Function(String) onError;

  ///播放完成
  final Function() onCompleted;

  /// 上一首
  final Function() onPrevious;

  ///下一首
  final Function() onNext;

  final Function(bool) onPlaying;

  final Key key;

  final Color color;

  /// 是否是本地资源
  final bool isLocal;

  const Player(
      {@required this.audioUrl,
        @required this.onCompleted,
        @required this.onError,
        @required this.onNext,
        @required this.onPrevious,
        this.key,
        this.volume: 1.0,
        this.onPlaying,
        this.color: Colors.white,
        this.isLocal: false});

  @override
  State<StatefulWidget> createState() {
    return new _PlayerState();
  }
}

class _PlayerState extends State<Player> {
  AudioPlayer audioPlayer;
  bool isPlaying = false;
  Duration duration;
  Duration position;
  double sliderValue;

  @override
  void initState() {
    super.initState();
    print("audioUrl:"+widget.audioUrl);

    audioPlayer = new AudioPlayer();
    audioPlayer..completionHandler = widget.onCompleted
    ..errorHandler = widget.onError;
  }

  @override
  void deactivate() {
    audioPlayer.release();
    super.deactivate();
  }

  @override
  void dispose() {
    audioPlayer.release();
    super.dispose();
  } //PositionChangeHandler handler;

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: _controllers(context),
    );
  }

  List<Widget> _controllers(BuildContext context) {
    print("_controllers");
    return [
      new Container(
        //padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: new Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new IconButton(
              onPressed: () {
                widget.onPrevious();
              },
              icon: new Icon(
                Icons.skip_previous,
                size: 32.0,
                color: widget.color,
              ),
            ),
            new IconButton(
              onPressed: () {
                if (isPlaying)
                  audioPlayer.pause();
                else {
                  audioPlayer.play(
                    widget.audioUrl,
                    isLocal: widget.isLocal,
                    volume: widget.volume,
                  );
                }
                setState(() {
                  isPlaying = !isPlaying;
                  widget.onPlaying(isPlaying);
                });
              },
              padding: const EdgeInsets.all(0.0),
              icon: new Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 48.0,
                color: widget.color,
              ),
            ),
            new IconButton(
              onPressed: widget.onNext,
              icon: new Icon(
                Icons.skip_next,
                size: 32.0,
                color: widget.color,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
