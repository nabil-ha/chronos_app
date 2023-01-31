import 'package:chronos/const.dart';
import 'package:chronos/pages/home_page.dart';
import 'package:flutter/material.dart';

Widget getLoginButton(
    {required BuildContext context,
    Widget? icon,
    required Function() onPressed}) {
  return Container(
    height: 50,
    width: 250,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: TextButton(
      onPressed: onPressed,
      child: icon != null
          ? Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Login using ",
                    style: titleStyle,
                  ),
                ),
                Expanded(flex: 1, child: icon),
              ],
            )
          : Text(
              icon == null ? 'Login' : "Login using ",
              style: titleStyle,
            ),
    ),
  );
}
