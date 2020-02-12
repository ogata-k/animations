import 'package:animations/animations/base.dart';
import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

// MEMO: ImplicitlyAnimatedWidgetの派生クラスではない
class AnimatedCrossFadePage extends StatefulWidget
    implements AnimationPageBase {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();

  @override
  String get name => 'animated cross fade';
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  var _showFirst = true;

  final _myIcon1 = MyIcon.square(size: 200);
  final _myIcon2 = MyIcon.square(
    size: 200,
    color: Colors.blueAccent,
  );

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _showFirst = !_showFirst;
        });
      },
      // MEMO: サイズが違うとクロスフェードが不自然になるので注意
      body: Center(
        child: AnimatedCrossFade(
          firstChild: _myIcon1,
          secondChild: _myIcon2,
          duration: const Duration(milliseconds: 500),
          crossFadeState:
              _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
