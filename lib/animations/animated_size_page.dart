import 'package:animations/animations/base.dart';
import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

// MEMO: ImplicitlyAnimatedWidgetの派生クラスではない
/// See: https://medium.com/flutter-community/flutter-working-with-animatedsize-35253ff8f16a
class AnimatedSizePage extends StatefulWidget implements AnimationPageBase {
  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();

  @override
  String get name => 'animated size';
}

class _AnimatedSizePageState extends State<AnimatedSizePage>
    with SingleTickerProviderStateMixin {
  var _isSmall = true;

  final MyIcon _smallIcon = MyIcon.square(size: 100);
  final MyIcon _largeIcon = MyIcon.square(size: 200);

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _isSmall = !_isSmall;
        });
      },
      body: Center(
        child: Container(
          color: Colors.blueAccent,
          child: AnimatedSize(
            vsync: this,
            duration: const Duration(milliseconds: 500),
            child: _isSmall ? _smallIcon : _largeIcon,
          ),
        ),
      ),
    );
  }
}
