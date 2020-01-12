import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_quiz/providers/InGameProvider.dart';
import 'package:math_quiz/screens/EndScreen/EndScreen.dart';
import 'package:provider/provider.dart';

bool checkAnswer(int selected, int res) => selected == res;

class QuestionAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool selection = (new Random().nextInt(2) == 0);
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          QuestionAnswerButton(
            isCorrectAnswer: selection,
          ),
          QuestionAnswerButton(
            isCorrectAnswer: !selection,
          ),
        ],
      ),
    );
  }
}

class QuestionAnswerButton extends StatelessWidget {
  final bool isCorrectAnswer;

  QuestionAnswerButton({@required this.isCorrectAnswer});

  @override
  Widget build(BuildContext context) {
    final _btnSize = MediaQuery.of(context).size.width * 0.25;
    return Consumer<InGameProvider>(
      builder: (_, provider, __) {
        final int answer = provider.questionData[isCorrectAnswer ? 3 : 4];
        return GestureDetector(
          child: Container(
            width: _btnSize,
            height: _btnSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.circular(_btnSize / 8),
            ),
            child: Text(
              '$answer',
              style: Theme.of(context).textTheme.display4,
            ),
          ),
          onTap: () => (isCorrectAnswer)
              ? {
                provider.handleScore(true),
                provider.handleNextQuestion(),
                if (provider.isClassic) {
                  provider.handleTimer(),
                }
              }
              : (provider.isClassic)? Navigator.of(context).pushNamedAndRemoveUntil(
                  EndScreen.routeName,
                  ModalRoute.withName('/'),
                  arguments: provider.gameScore,
                ) : {
                  provider.handleScore(false),
                  provider.handleNextQuestion(),
                },
        );
      },
    );
  }
}
