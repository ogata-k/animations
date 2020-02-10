import 'package:animations/animations/base.dart';
import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

class AnimatedPhysicalModelPage extends StatefulWidget
    implements AnimationPageBase {
  @override
  _AnimatedPhysicalModelPageState createState() =>
      _AnimatedPhysicalModelPageState();

  @override
  String get name => 'animatedPhysicalModel';
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> {
  var _hasElevation = false;
  final _myIcon = MyIcon.maxSize();

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: 'AnimatedPhysicalModel',
      action: () {
        setState(() {
          _hasElevation = !_hasElevation;
        });
      },
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: AnimatedPhysicalModel(
            color: Colors.purple,
            shadowColor: Colors.black,
            shape: BoxShape.circle,
            duration: const Duration(milliseconds: 500),
            elevation: _hasElevation ? 16 : 0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: _myIcon,
            ),
          ),
        ),
      ),
    );
  }
}
