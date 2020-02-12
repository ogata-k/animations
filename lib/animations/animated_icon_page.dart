import 'package:animations/animations/base.dart';
import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget implements AnimationPageBase {
  AnimatedIconPage({Key key}) : super(key: key);

  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();

  @override
  String get name => 'animated icon';
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _isReverse = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      // これを使うために with SingleTickerProviderStateMixinでTickerProviderを実装している
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () async {
        if ([AnimationStatus.forward, AnimationStatus.reverse]
            .contains(_controller.status)) {
          // アニメーション中は無視
          return;
        }
        if (!_isReverse) {
          await _controller.forward();
        } else {
          await _controller.reverse();
        }
        setState(() {
          _isReverse = !_isReverse;
        });
      },
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildAnimatedIcon(AnimatedIcons.add_event, label: 'add_event'),
            _buildAnimatedIcon(AnimatedIcons.pause_play, label: 'pause_play'),
            _buildAnimatedIcon(AnimatedIcons.close_menu, label: 'close_menu'),
            _buildAnimatedIcon(AnimatedIcons.ellipsis_search,
                label: 'ellipsis_search'),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(AnimatedIconData icon, {@required String label}) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedIcon(
            icon: icon,
            progress: _controller,
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
