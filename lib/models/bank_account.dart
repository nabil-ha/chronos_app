import 'dart:typed_data';

import 'package:flutter/material.dart';

class BankAccount {
  String name, iban;
  Image? icon;
  BankAccount({
    required this.name,
    required this.iban,
    this.icon,
  });
}
