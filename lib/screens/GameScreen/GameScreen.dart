import 'package:flutter/material.dart';
import 'package:math_quiz/providers/InGameProvider.dart';
import 'package:math_quiz/screens/GameScreen/components/GameScore.dart';
import 'package:math_quiz/screens/GameScreen/components/GameTimer.dart';
import 'package:math_quiz/screens/GameScreen/components/QuestionAnswers.dart';
import 'package:math_quiz/screens/GameScreen/components/QuestionTitle.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/gameScreen';
  final bool isClassic;

  GameScreen({@required this.isClassic});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InGameProvider>(
        create: (_) => new InGameProvider(
              timeBarValue: this.isClassic ? 8 : 60,
              isClassic: this.isClassic,
            ),
        child: _InnerGameScreen());
  }
}

class _InnerGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _inGameProvider = Provider.of<InGameProvider>(context, listen: false);
    print(_inGameProvider.isClassic);
    return Scaffold(
      appBar: AppBar(
        title: Selector<InGameProvider, int>(
          selector: (_, provider) => provider.questionNumber,
          builder: (_, data, __) => Text('Question $data'),
        ),
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.amber[200],
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Consumer<InGameProvider>(
                  builder: (_, provider, __) {
                    return GameTimer(
                      timerValue: provider.timeBarValue,
                      isClassic: provider.isClassic,
                    );
                  }),
            ),
            GameScore(),
            QuestionTitle(),
            Center(
              child: QuestionAnswers(),
            ),
          ],
        ),
      ),
    );
  }
}
