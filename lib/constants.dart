import 'package:flutter/material.dart';

const Color green = Colors.greenAccent;
const Color black = Colors.black;
const Color white = Colors.white;
const Color grey = Colors.grey;
const Color indigo = Color(0xff283593);

TextStyle textStyle(
    {color = black, size = 25, fontWeight = FontWeight.normal}) {
  return TextStyle(
    color: color,
    fontSize: size.toDouble(),
    fontWeight: fontWeight,
  );
}

roundedShape(double radius) {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
}
