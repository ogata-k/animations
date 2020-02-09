import 'package:animations/animations/base.dart';
import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

class AnimatedPaddingPage extends StatefulWidget implements AnimationPageBase {
  AnimatedPaddingPage({Key key}) : super(key: key);

  @override
  _AnimatedPaddingPageState createState() => _AnimatedPaddingPageState();

  @override
  String get name => 'animated padding';
}

class _AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
  bool _withPadding = false;

  final _myIconImg = MyIcon.maxSize();
  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _withPadding = !_withPadding;
        });
      },
      body: AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.all(_withPadding ? 60 : 0),
        curve: Curves.bounceOut,
        child: _myIconImg,
      ),
    );
  }
}
