import 'dart:typed_data';

import 'package:chronos/models/user.dart';

class PersonalDebt {
  User fromUser;
  User toUser;
  double totalAmount;
  DateTime dateStarted;
  int? durationMonths;
  bool isAccepted;
  PersonalDebt({
    required this.dateStarted,
    this.durationMonths,
    required this.fromUser,
    required this.toUser,
    required this.totalAmount,
    required this.isAccepted,
  });
}
