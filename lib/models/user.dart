import 'dart:typed_data';

class User {
  int? id;
  String username, name;
  double totalIncome;
  Uint8List? avatar;
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.totalIncome,
    this.avatar,
  });
}
