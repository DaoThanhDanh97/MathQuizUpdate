import 'package:flutter/material.dart';
import 'package:math_quiz/screens/WelcomeScreen/welcomeMode.dart';
import 'package:math_quiz/screens/WelcomeScreen/welcomeUser.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _controller = new PageController(initialPage: 0);

  void triggerNextOrPrevious(bool isNext) {
    if (isNext)
      _controller.nextPage(
        duration: Duration(milliseconds: 75),
        curve: Curves.easeIn,
      );
    else
      _controller.previousPage(
        duration: Duration(milliseconds: 75),
        curve: Curves.easeOut,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/math_quiz_bg.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              WelcomeUser(parentFunction: this.triggerNextOrPrevious),
              WelcomeMode(parentFunction: this.triggerNextOrPrevious),
            ],
          )),
    );
  }
}
