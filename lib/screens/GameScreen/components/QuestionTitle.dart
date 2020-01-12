import 'package:flutter/material.dart';
import 'package:math_quiz/providers/InGameProvider.dart';
import 'package:math_quiz/screens/GameScreen/GameScreen.const.dart';
import 'package:provider/provider.dart';

class QuestionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -0.4),
      child: Selector<InGameProvider, List<int>>(
        selector: (_, provider) => provider.questionData,
        builder: (_, data, __) {
          return Text(
            '${data[0]} ${opList[data[2]]} ${data[1]} = ?',
            style: Theme.of(context).textTheme.display3,
          );
        },
      ),
    );
  }
}
