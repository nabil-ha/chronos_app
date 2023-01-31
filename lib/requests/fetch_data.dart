import 'package:chronos/models/transaction.dart';
import 'package:chronos/models/user.dart';
import 'package:chronos/services/dio_client.dart';
import 'package:flutter/material.dart';

Future<User?> loginUser(String username, String password) async {
  var res = await DioHelper.dio.post("api/login-user", data: {
    "username": username,
    "password": password,
  });
  Map data = res.data;
  return User(
    id: data["id"],
    username: username,
    name: data["name"],
    totalIncome: data["totalIncome"],
  );
}

Future<List<Transaction>?> fetchTransactions(BuildContext context) async {
  var res = await DioHelper.dio.get("api/transactions");
  List<Transaction> transactions =
      (res.data as List).map((e) => Transaction.fromJson(e)).toList();
  return transactions;
  // return res;
}
