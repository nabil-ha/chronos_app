import 'package:chronos/components/chart.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/pages/notifications_page.dart';
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
    List<Transaction> transactions = appCubit.getTransactions();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        child: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: const Icon(
            Icons.add_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      backgroundColor: appCubit.getBackgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurvedAppBar(
              widget: WelcomeBar(appCubit: appCubit),
              height: 300,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  itemCount: appCubit.getTransactions().length,
                  itemBuilder: (context, i) {
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
                                child: Icon(
                                  transactions[i].category.icon ??
                                      Icons.shopping_cart_outlined,
                                  size: 35,
                                  color: Colors.white,
                                ),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    Key? key,
    required this.appCubit,
  }) : super(key: key);

  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NotificationsPage()));
            },
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.white,
            iconSize: 45,
          ),
          top: 70,
          left: 360,
        ),
        const Positioned(
          top: 80,
          left: 10,
          child: Text(
            "Welcome",
            style: subTitleStyle,
          ),
        ),
        Positioned(
          top: 110,
          left: 8,
          child: Text(
            appCubit.getUser().name,
            style: titleStyleWhite,
          ),
        ),
        const Positioned(
            top: 180,
            left: 30,
            child: Text(
              "Your expenses\nchanged by",
              style: subHeadStyleWhite,
            )),
        Positioned(
          top: 170,
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
          top: 215,
          left: 240,
          child: Text(
            "since last month",
            style: subTitleStyle,
          ),
        ),
      ],
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
            const Text(
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
