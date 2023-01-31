import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/transaction.dart';
import 'package:flutter/material.dart';

class ExpensesTab extends StatelessWidget {
  const ExpensesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    List<Transaction> transactions = appCubit.getTransactions();
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transactions.length,
        itemBuilder: (context, i) {
          return SizedBox(
            height: 130,
            child: Card(
              color: appCubit.getBackgroundColor(),
              elevation: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      transactions[i].category.icon,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Text(
                      transactions[i].name,
                      style: subTitleStyle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${transactions[i].amount.toStringAsFixed(2)} SAR",
                      style: subTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
