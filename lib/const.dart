import 'package:flutter/material.dart';

const TextStyle titleStyle =
    TextStyle(fontFamily: "Merriweather", fontSize: 30, color: Colors.black);
const TextStyle subTitleStyle =
    TextStyle(fontFamily: "Merriweather", fontSize: 18, color: Colors.black);

Gradient gradientGreenColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Colors.green[800]!,
    Colors.green[400]!,
  ],
);
