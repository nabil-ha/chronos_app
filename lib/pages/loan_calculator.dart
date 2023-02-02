import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/components/textfield.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:flutter/material.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        children: [
          CurvedAppBar(
            title: "Loan Calculator",
            isBackButton: true,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: getTextField(
              title: "Amount",
              onChanged: (p0) {},
            ),
          )
        ],
      ),
    );
  }
}
