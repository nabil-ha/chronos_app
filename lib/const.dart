import 'package:flutter/material.dart';

const TextStyle titleStyle = TextStyle(
    fontFamily: "Merriweather",
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold);
const TextStyle subHeadStyle = TextStyle(
  fontFamily: "Merriweather",
  fontSize: 25,
  color: Colors.white,
);
const TextStyle subTitleStyle =
    TextStyle(fontFamily: "Merriweather", fontSize: 18, color: Colors.white);

Gradient gradientGreenColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Colors.green[800]!,
    Colors.green[400]!,
  ],
);
