import 'package:flutter/material.dart';
import 'package:math_quiz/screens/EndScreen/EndScreen.dart';

class GameTimer extends StatefulWidget {
  final int timerValue;
  final bool isClassic;

  GameTimer({this.timerValue, this.isClassic});

  @override
  _GameTimerState createState() => _GameTimerState();
}

class _GameTimerState extends State<GameTimer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: Duration(seconds: widget.timerValue),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _deviceWidth = MediaQuery.of(context).size.width;
    _controller
      ..addListener(
        () => {
          if (_controller.value == 1)
            Navigator.of(context).pushNamedAndRemoveUntil(
                EndScreen.routeName, ModalRoute.withName('/'))
        },
      );
    // handle animation controller depending on the type
    if (widget.isClassic) {
      _controller.duration = Duration(seconds: widget.timerValue);
      _controller.reset();
    }
    _controller.forward();

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Container(
        width: _deviceWidth,
        height: 16,
        color: Colors.grey[700],
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            Container(
              height: 8,
              width: _deviceWidth * _controller.value,
            ),
          ],
        ),
      ),
    );
  }
}
