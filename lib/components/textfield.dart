import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

TextField getTextField({required String title, bool? isHidden}) {
  return TextField(
    obscureText: isHidden ?? false,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: subTitleStyle,
        hintText: title,
        fillColor: Colors.white70),
  );
}
