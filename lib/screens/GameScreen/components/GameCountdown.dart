import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_quiz/screens/GameScreen/GameScreen.dart';

class GameCountdown extends StatefulWidget {
  static const routeName = '/gameCountdown';

  @override
  _GameCountdownState createState() => _GameCountdownState();
}

class _GameCountdownState extends State<GameCountdown> {
  int countdownValue = 3;
  Timer _timer;
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        _duration,
        (_) => countdownValue > 1
            ? this.setState(() {
                countdownValue--;
              })
            : this.onTimerEnd());
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: Text(
              '$countdownValue',
              style: Theme.of(context).textTheme.display2,
            ),
          ),
        ),
      ),
    );
  }

  void onTimerEnd() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (buildCtx, _, __) => GameScreen(isClassic: ModalRoute.of(context).settings.arguments),
      ),
    );
  }
}
