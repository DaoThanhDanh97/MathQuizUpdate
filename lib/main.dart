import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_quiz/screens/EndScreen/EndScreen.dart';
import 'package:math_quiz/screens/GameScreen/components/GameCountdown.dart';

import 'screens/WelcomeScreen/welcomeScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 0,
        ),
        textTheme: TextTheme().copyWith(
          display2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 100,
          ),
          display3: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cabin',
            fontSize: 40,
          ),
          display4: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
        ),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => WelcomeScreen(),
        EndScreen.routeName: (context) => EndScreen(),
        GameCountdown.routeName: (context) => GameCountdown(),
      },
    );
  }
}
