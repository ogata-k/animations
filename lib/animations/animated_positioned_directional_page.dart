import 'package:animations/animations/base.dart';
import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedDirectionalPage extends StatefulWidget
    implements AnimationPageBase {
  @override
  _AnimatedPositionedDirectionalPageState createState() =>
      _AnimatedPositionedDirectionalPageState();

  @override
  String get name => 'animated positioned directional';
}

class _AnimatedPositionedDirectionalPageState
    extends State<AnimatedPositionedDirectionalPage> {
  var _shrinked = true;
  final double _size = 300;

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _shrinked = !_shrinked;
        });
      },
      body: Center(
        child: Container(
          width: _size,
          height: _size,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.6,
                child: MyIcon.square(size: 500),
              ),
              // nullと数値指定の変化のアニメーションには非対応なので注意
              Directionality(
                textDirection: TextDirection.rtl,
                child: AnimatedPositionedDirectional(
                  top: 0,
                  start: 0,
                  width: _shrinked ? _size * 0.2 : _size,
                  duration: const Duration(milliseconds: 500),
                  child: MyIcon.maxSize(),
                  curve: Curves.bounceOut,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
