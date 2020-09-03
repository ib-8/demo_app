import 'package:flutter/material.dart';
import 'package:flutter_web/demo_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.onPressed,
    this.buttonText,
    this.buttonColor,
    this.buttonTextStyle,
    this.horizontalPadding = 30.0,
    this.verticalPadding = 10.0,
    Key key,
  }) : super(key: key);

  final Function onPressed;
  final String buttonText;
  final Color buttonColor;
  final TextStyle buttonTextStyle;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: buttonColor,
      shape: roundedShape(40),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Text(
        buttonText,
        style: buttonTextStyle,
      ),
      onPressed: onPressed,
    );
  }
}
