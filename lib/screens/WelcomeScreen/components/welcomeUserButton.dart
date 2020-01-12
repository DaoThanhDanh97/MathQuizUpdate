import 'package:flutter/material.dart';

class _ButtonText extends StatelessWidget {
  final String _text;
  final Color _color;

  _ButtonText(this._text, this._color);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: _color,
      ),
    );
  }
}

class WelcomeUserButton extends StatelessWidget {
  final Function onTap;
  final bool hasIcon;
  final Widget icon;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final bool hasBorder;

  WelcomeUserButton({
    @required this.onTap,
    @required this.hasIcon,
    @required this.hasBorder,
    this.icon,
    @required this.title,
    @required this.titleColor,
    @required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final _buttonText = _ButtonText(title, titleColor);

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: hasBorder ? Border.all() : null,
            color: backgroundColor,
          ),
          alignment: Alignment.center,
          child: (this.hasIcon)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 34,
                      width: 34,
                      child: this.icon,
                    ),
                    SizedBox(width: 16),
                    _buttonText
                  ],
                )
              : _buttonText),
    );
  }
}
