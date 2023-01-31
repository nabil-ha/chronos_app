import 'package:bloc/bloc.dart';
import 'package:chronos/cubits/app_states.dart';
import 'package:chronos/models/bank_account.dart';
import 'package:chronos/models/category.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  bool isDarkTheme = true;
  List<Category> demoCategories = [
    Category(name: "Shopping", icon: const Icon(Icons.shopping_cart_outlined))
  ];
  List<BankAccount> demoBankAccounts = [
    BankAccount(name: "Alrajhi Bank", iban: "238974198723129387123222"),
    BankAccount(name: "AlAhli Bank", iban: "109834857531293871232224"),
  ];

  List<Transaction> getTransactions() {
    List<Transaction> demoTransactions = [
      Transaction(
        bank: demoBankAccounts[0],
        name: "Nike Store",
        category: demoCategories[0],
        amount: 200,
        date: DateTime.now(),
      ),
    ];
    return demoTransactions;
  }

  Color? getBackgroundColor() {
    return isDarkTheme ? Colors.grey[900] : Colors.white;
  }

  double getTotalExpenses() {
    double total = 0;
    List<Transaction> transactions = getTransactions();
    for (int i = 0; i < transactions.length; i++) {
      total += transactions[i].amount;
    }
    return total;
  }

  User getUser() {
    return User(
      id: 1,
      username: "nabil",
      name: "Nabil",
      totalIncome: 10000,
    );
  }

  double getExpensesChangeRatio() {
    return 25;
  }
}