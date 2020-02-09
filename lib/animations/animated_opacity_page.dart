import 'package:animations/animations/base.dart';
import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget implements AnimationPageBase {
  AnimatedOpacityPage({Key key}) : super(key: key);

  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();

  @override
  String get name => 'animated opacity';
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool _withOpacity = false;

  final _myIcon = MyIcon.square(size: 100);

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _withOpacity = !_withOpacity;
        });
      },
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _withOpacity ? 0.3 : 1.0,
          child: _myIcon,
        ),
      ),
    );
  }
}
