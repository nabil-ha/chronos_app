import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget {
  String? title;
  bool? isBackButton;
  double? height;
  Widget? widget;
  CurvedAppBar({this.title, this.isBackButton, this.height, this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      alignment: (title != null) ? Alignment.center : null,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradientGreenColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 50.0),
        ),
      ),
      child: (widget != null)
          ? widget
          : title != null
              ? Text(
                  title!,
                  style: titleStyleWhite,
                )
              : const SizedBox(),
    );
  }
}
