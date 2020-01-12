import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:math_quiz/screens/WelcomeScreen/components/welcomeUserButton.dart';

class WelcomeUser extends StatelessWidget {
  final Function(bool) parentFunction;

  WelcomeUser({
    @required this.parentFunction,
  });

  @override
  Widget build(BuildContext context) {
    final _titleText = Text(
      'QUICK MATHZ',
      style: TextStyle(
        fontFamily: 'Sansation',
        fontSize: 40,
        color: (!kIsWeb) ? Colors.white : Colors.black,
      ),
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          (!kIsWeb)
              ? ShaderMask(
                  shaderCallback: (Rect bounds) => LinearGradient(
                    colors: [Colors.red[400], Colors.amber[700]],
                    stops: [0.0, 0.77],
                  ).createShader(
                    Offset.zero & bounds.size,
                  ),
                  child: _titleText,
                )
              : _titleText,
          SizedBox(height: 16),
          WelcomeUserButton(
            hasIcon: true,
            hasBorder: true,
            icon: Image.asset(
              'assets/images/google_logo.jpg',
              fit: BoxFit.contain,
            ),
            backgroundColor: Colors.white,
            title: 'Sign in with Google',
            titleColor: Colors.black,
            onTap: null,
          ),
          SizedBox(height: 16),
          WelcomeUserButton(
            onTap: () => this.parentFunction(true),
            hasIcon: false,
            hasBorder: false,
            backgroundColor: Colors.grey[500],
            title: 'Play as Guest',
            titleColor: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
