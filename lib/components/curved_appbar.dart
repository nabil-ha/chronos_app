import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget {
  String title;
  CurvedAppBar({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.green[400],
        gradient: gradientGreenColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 50.0),
        ),
      ),
      child: Text(
        title,
        style: titleStyle,
      ),
    );
  }
}
