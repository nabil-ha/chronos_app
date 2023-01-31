import 'package:chronos/components/chart.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/transaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurvedAppBar(
            widget: Stack(
              children: [
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined),
                    iconSize: 45,
                  ),
                  top: 40,
                  left: 10,
                ),
                const Positioned(
                  top: 100,
                  left: 10,
                  child: Text(
                    "Welcome",
                    style: subTitleStyle,
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 8,
                  child: Text(
                    appCubit.getUser().name,
                    style: titleStyleWhite,
                  ),
                ),
                const Positioned(
                    top: 200,
                    left: 30,
                    child: Text(
                      "Your expenses\nchanged by",
                      style: subHeadStyleWhite,
                    )),
                Positioned(
                  top: 190,
                  left: 250,
                  child: Text(
                    (appCubit.getExpensesChangeRatio() > 0)
                        ? "+${appCubit.getExpensesChangeRatio().toStringAsFixed(0)}%"
                        : "-${appCubit.getExpensesChangeRatio().toStringAsFixed(0)}%",
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.redAccent,
                      fontFamily: "Merriweather",
                    ),
                  ),
                ),
                const Positioned(
                  top: 250,
                  left: 240,
                  child: Text(
                    "since last month",
                    style: subTitleStyle,
                  ),
                ),
              ],
            ),
            height: 300,
          ),
          Center(
            child: TotalExpensesCard(appCubit: appCubit),
          ),
          const SizedBox(height: 20),
          const Center(
            child: PieChartCard(),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Recent Transactions",
              style: subTitleStyle,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: appCubit.getTransactions().length,
            itemBuilder: (context, i) {
              print(i);
              List<Transaction> transactions = appCubit.getTransactions();
              return SizedBox(
                height: 100,
                width: 400,
                child: Card(
                  color: Colors.grey[900],
                  elevation: 10,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: transactions[i].category.icon,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          transactions[i].name,
                          style: subTitleStyle,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            transactions[i].amount.toStringAsFixed(2),
                            style: subTitleStyle,
                          )),
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}

class PieChartCard extends StatelessWidget {
  const PieChartCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 340,
      child: Card(
        elevation: 10,
        color: Colors.grey[850],
        child: Column(
          children: [
            Text(
              "Daily Expenses",
              style: subHeadStyleWhite,
            ),
            DailyExpensesPieChart()
          ],
        ),
      ),
    );
  }
}

class TotalExpensesCard extends StatelessWidget {
  const TotalExpensesCard({
    Key? key,
    required this.appCubit,
  }) : super(key: key);

  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 100,
      child: Card(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        color: Colors.grey[850],
        elevation: 10,
        child: Column(
          children: [
            const Text(
              "Expenses this month",
              style: subTitleStyle,
            ),
            Text(
              "${appCubit.getTotalExpenses().toStringAsFixed(2)} SAR",
              style: titleStyleWhite,
            ),
          ],
        ),
      ),
    );
  }
}
