import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/bank_account.dart';
import 'package:chronos/models/personal_debt.dart';
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

Future<List<PersonalDebt>> fetchPersonalDebts(BuildContext context) async {
  var res = await DioHelper.dio.get('api/personal-debts');
  List<PersonalDebt> personalDebts =
      (res.data as List).map((e) => PersonalDebt.fromJson(e)).toList();
  return personalDebts;
}

Future<List<BankAccount>> fetchBankAccounts(BuildContext context) async {
  var res = await DioHelper.dio.get('api/bank-accounts');
  List<BankAccount> bankAccounts =
      (res.data as List).map((e) => BankAccount.fromJson(e)).toList();
  return bankAccounts;
}
