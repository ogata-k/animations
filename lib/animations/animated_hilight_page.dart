import 'package:flutter/material.dart';

import '../my_icon.dart';
import 'base.dart';

class AnimatedHighlightContainerPage extends StatefulWidget
    implements AnimationPageBase {
  AnimatedHighlightContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedHighlightContainerPageState createState() =>
      _AnimatedHighlightContainerPageState();

  @override
  String get name => 'animated highlight container';
}

class _AnimatedHighlightContainerPageState
    extends State<AnimatedHighlightContainerPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;

  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  final _myIcon = MyIcon.square(size: 100);

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () async {
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('確認'),
                content: Text('枠内をタップしてください。'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('確認'),
                  ),
                ],
              );
            });
      },
      body: HighlightChangeContainer(
        alignment: _alignment,
        // 下のcolor系かdecoration系かどちらかを指定
        //backGroundColor: Colors.red,
        //highlightColor: Colors.green,
        //disabledColor: Colors.white54,
        baseDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8.0),
        ),
        onHighlightDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledDecoration: BoxDecoration(
          color: Colors.white54,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          setState(() {
            _index += 1;
          });
        },
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        duration: const Duration(milliseconds: 100),
        child: _myIcon,
        curve: Curves.linear,
      ),
    );
  }
}

/// タップ時にハイライトを表示してそれが終わってからタップ処理を開始するコンテナ
class HighlightChangeContainer extends StatefulWidget {
  final double width;
  final double height;
  final AlignmentGeometry alignment;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Curve curve;
  final Duration duration;

  // このchildに色が指定されている場合は
  // ハイライトがchildに隠れて見えなくなってしまうので注意
  final Widget child;
  final VoidCallback onPressed;

  // 背景色
  // decoration
  final Color backGroundColor;
  final Color disabledColor;
  final Color highlightColor;

  // nullならbackgroundColorを利用した長方形
  final BoxDecoration baseDecoration;

  // デフォルトではbaseDecorationを利用
  final BoxDecoration disabledDecoration;

  // デフォルトではbaseDecorationの色を修正したもの利用
  final BoxDecoration onHighlightDecoration;

  HighlightChangeContainer({
    Key key,
    this.width,
    this.height,
    this.alignment,
    this.margin,
    this.padding,
    this.curve = Curves.linear,
    @required this.duration = const Duration(milliseconds: 100),
    this.child,
    this.onPressed,
    this.backGroundColor,
    this.disabledColor,
    this.highlightColor,
    this.baseDecoration,
    this.disabledDecoration,
    this.onHighlightDecoration,
  })  : assert(duration != null),
        assert((backGroundColor == null &&
                highlightColor == null &&
                disabledColor == null &&
                baseDecoration != null) ||
            (backGroundColor != null && baseDecoration == null)),
        super(key: key);

  @override
  _HighlightChangeContainerState createState() =>
      _HighlightChangeContainerState();
}

class _HighlightChangeContainerState extends State<HighlightChangeContainer> {
  bool _isHighlight;

  @override
  void initState() {
    super.initState();
    _isHighlight = false;
  }

  @override
  Widget build(BuildContext context) {
    final Widget _child = AnimatedContainer(
      width: widget.width,
      height: widget.height,
      alignment: widget.alignment,
      padding: widget.padding,
      margin: widget.margin,
      duration: widget.duration,
      curve: widget.curve,
      decoration: _getDecoration(),
      color: _getColor(),
      child: widget.child,
    );
    return widget.onPressed == null
        ? _child
        : GestureDetector(
            onTapDown: (_) async {
              setState(() {
                _isHighlight = true;
              });
            },
            onTapUp: (_) async {
              setState(() {
                _isHighlight = false;
              });
              await Future.delayed(widget.duration, () {
                if (widget.onPressed != null) {
                  widget.onPressed();
                }
              });
            },
            onTapCancel: () {
              setState(() {
                _isHighlight = false;
              });
            },
            child: _child,
          );
  }

  Color _getColor() {
    if (widget.backGroundColor == null) {
      return null;
    }
    if (widget.onPressed == null) {
      return widget.disabledColor ??
          Color.alphaBlend(
              Colors.grey.withOpacity(0.6), widget.backGroundColor);
    }
    return _isHighlight
        ? (widget.highlightColor ?? Colors.grey.withOpacity(0.6))
        : widget.backGroundColor;
  }

  BoxDecoration _getDecoration() {
    if (widget.backGroundColor != null) {
      return null;
    }
    if (widget.onPressed == null) {
      return widget.disabledDecoration ?? widget.baseDecoration;
    }
    return _isHighlight
        ? (widget.onHighlightDecoration ??
            widget.baseDecoration.copyWith(
                color: Color.alphaBlend(
              Colors.grey.withOpacity(0.6),
              widget.baseDecoration.color,
            )))
        : widget.baseDecoration;
  }
}
