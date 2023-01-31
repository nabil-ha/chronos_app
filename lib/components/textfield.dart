import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

TextField getTextField(
    {required String title, bool? isHidden, IconData? icon}) {
  return TextField(
    obscureText: isHidden ?? false,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: subTitleStyle,
        hintText: title,
        fillColor: Colors.transparent),
  );
}
