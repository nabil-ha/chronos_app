import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

class NotificationsLoansTab extends StatefulWidget {
  const NotificationsLoansTab({Key? key}) : super(key: key);

  @override
  State<NotificationsLoansTab> createState() => _NotificationsLoansTabState();
}

class _NotificationsLoansTabState extends State<NotificationsLoansTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Loans",
            style: subTitleStyle,
          ),
        )
      ],
    );
  }
}
