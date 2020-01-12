import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_quiz/screens/GameScreen/components/GameCountdown.dart';
import 'package:math_quiz/screens/WelcomeScreen/components/welcomeModeButton.dart';

class WelcomeMode extends StatelessWidget {
  final Function(bool) parentFunction;

  WelcomeMode({
    @required this.parentFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  WelcomeModeButton(
                    onTap: () => {
                      Navigator.of(context)
                          .pushNamed(GameCountdown.routeName, arguments: true),
                      Future.delayed(new Duration(seconds: 1),
                          () => this.parentFunction(false))
                    },
                    title: 'Classic',
                    maxLines: 1,
                    basePaddingPixelTwo: 19,
                  ),
                  WelcomeModeButton(
                    onTap: () => Navigator.of(context)
                        .pushNamed(GameCountdown.routeName, arguments: false),
                    title: 'Time Limit\n(60s)',
                    maxLines: 2,
                    basePaddingPixelTwo: 8,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: GestureDetector(
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black38,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => this.parentFunction(false),
            ),
          ),
        ],
      ),
    );
  }
}
