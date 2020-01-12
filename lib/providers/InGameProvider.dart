import 'dart:math';

import 'package:flutter/material.dart';

class InGameProvider extends ChangeNotifier {
  int questionNumber = 1;
  int timeBarValue = 0;
  bool isClassic;
  int gameScore = 0;
  List<int> questionData = [0, 0, 0, 0, 0];

  InGameProvider({@required this.timeBarValue, @required this.isClassic}) {
    this.questionData = this.createQuestionData();
  }

  handleNextQuestion() {
    this.questionNumber++;
    this.questionData = createQuestionData();
    notifyListeners();
  }

  // will work with LTM later...
  handleScore(bool value) {
    (value) ? this.gameScore++ : this.gameScore--;
    notifyListeners();
  }

  handleTimer() {
    if (this.questionNumber < 6)
      this.timeBarValue = 6;
    else if (this.questionNumber < 12)
      this.timeBarValue = 5;
    else if (this.questionNumber < 18)
      this.timeBarValue = 4;
    else this.timeBarValue = 3;
    notifyListeners();
  }

  int createWrongResult(int val) =>
      (new Random().nextInt(2) == 1 ? val + 10 : val - 10);

  List<int> createQuestionData() {
    Random random = new Random();
    int op = random.nextInt(4);

    switch (op) {
      // Plus
      case 0:
        {
          int firstValue = random.nextInt(100);
          int secondValue = random.nextInt(100);
          int rightValue = firstValue + secondValue;
          int wrongResult = createWrongResult(rightValue);
          return [firstValue, secondValue, op, rightValue, wrongResult];
        }

      // Minus
      case 1:
        {
          int firstValue = random.nextInt(100);
          int secondValue = random.nextInt(100);
          int rightValue = firstValue - secondValue;
          int wrongResult = createWrongResult(rightValue);
          return [firstValue, secondValue, op, rightValue, wrongResult];
        }

      // Multiply
      case 2:
        {
          int firstValue = random.nextInt(25);
          int secondValue = random.nextInt(25);
          int rightValue = firstValue * secondValue;
          int wrongResult = createWrongResult(rightValue);
          return [firstValue, secondValue, op, rightValue, wrongResult];
        }

      // Divide
      case 3:
        {
          int secondValue = random.nextInt(25);
          int rightValue = random.nextInt(25);
          int firstValue = secondValue * rightValue;
          int wrongResult = createWrongResult(rightValue);
          return [firstValue, secondValue, op, rightValue, wrongResult];
        }

      // Default
      default:
        return [];
    }
  }
}
