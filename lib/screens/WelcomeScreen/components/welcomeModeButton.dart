import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WelcomeModeButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final int maxLines;
  final double basePaddingPixelTwo;

  WelcomeModeButton({
    @required this.onTap,
    @required this.title,
    @required this.maxLines,
    @required this.basePaddingPixelTwo,
  });

  double calculatePadding(BuildContext context) {
    double queryWidth = MediaQuery.of(context).size.width;
    if (queryWidth * 0.3 > 500) {
      return (maxLines == 2) ? 32 : 66;
    } else
      return basePaddingPixelTwo * queryWidth / 411;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 60 * MediaQuery.of(context).size.width / 411,
        constraints: BoxConstraints(
          maxHeight: 200,
          maxWidth: 500,
        ),
        padding: EdgeInsets.symmetric(vertical: calculatePadding(context)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[600], Colors.purple[600]],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )..createShader(Rect.fromLTWH(0, 0, 500, 200)),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: AutoSizeText(
          title,
          maxLines: maxLines,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Cabin',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
