import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  static const routeName = '/endScreen';

  @override
  Widget build(BuildContext context) {
    final int _gameScore = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Your score is: $_gameScore'),
        ),
      ),
    );
  }
}
