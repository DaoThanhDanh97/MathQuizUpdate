import 'package:flutter/material.dart';
import 'package:math_quiz/providers/InGameProvider.dart';
import 'package:provider/provider.dart';

class GameScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 32),
        child: Selector<InGameProvider, int>(
        selector: (_, provider) => provider.gameScore,
        builder: (_, data, __) {
          return Text(
            'Current score: $data',
            style: TextStyle(
              color: Colors.indigo[700],
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          );
        },
      )
      ),
    );
  }
}