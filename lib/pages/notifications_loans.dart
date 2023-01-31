import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/personal_debt.dart';
import 'package:flutter/material.dart';

class PersonalDebtsTab extends StatefulWidget {
  const PersonalDebtsTab({Key? key}) : super(key: key);

  @override
  State<PersonalDebtsTab> createState() => _PersonalDebtsTabState();
}

class _PersonalDebtsTabState extends State<PersonalDebtsTab> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    List<PersonalDebt> personalDebts = appCubit.getPersonalDebts();
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: personalDebts.length,
        itemBuilder: (context, i) {
          return SizedBox(
            height: 200,
            child: Card(
              color: appCubit.getBackgroundColor(),
              elevation: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      personalDebts[i].toUser.name,
                      style: subTitleStyle,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${personalDebts[i].totalAmount.toStringAsFixed(2)} SAR",
                      style: subTitleStyle,
                    ),
                  ),
                  // const SizedBox(width: 10),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(
                  //     transactions[i].amount.toStringAsFixed(2),
                  //     style: subTitleStyle,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
