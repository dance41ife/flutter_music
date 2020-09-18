import 'dart:math' as math;
import 'package:flutter/material.dart';

class MusicPlayerContainer extends StatefulWidget {
  final MusicPlayerContainerState _musicPlayerContainerState =
      MusicPlayerContainerState();

  void stopAnimation() {
    _musicPlayerContainerState.stopRotate();
  }
  void startAnimation(){
    _musicPlayerContainerState.startRotate();
  }

  @override
  State<StatefulWidget> createState() {
    return _musicPlayerContainerState;
  }
}

class MusicPlayerContainerState extends State<MusicPlayerContainer>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  void stopRotate() {
    _animationController.stop();
  }

  void startRotate(){
    _animationController.repeat();
  }
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation =
        Tween<double>(begin: 0, end: math.pi * 2).animate(_animationController)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Transform.rotate(
                  angle: _animation.value,
                  child: new Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        image: DecorationImage(
                            image: AssetImage('asset/music_icon.jpg')),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
