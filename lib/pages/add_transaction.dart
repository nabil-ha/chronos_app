import 'package:chronos/components/buttons/add_button.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/components/textfield.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/category.dart';
import 'package:chronos/models/transaction.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  AddExpensePage({Key? key, this.transaction}) : super(key: key);
  Transaction? transaction;
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  Category? selected;
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    List<Category> categories = appCubit.demoCategories;

    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        children: [
          CurvedAppBar(
            title: "Add a Transaction",
            isBackButton: true,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTextField(
                    title: "Amount", icon: Icons.attach_money_outlined),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "  Choose a Category",
                  style: subTitleStyle,
                ),
                buildCategoryChips(categories),
                const SizedBox(height: 10),
                getTextField(title: "Transaction Title"),
                const SizedBox(height: 10),
                getTextField(title: "Notes", icon: Icons.note_alt_outlined),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: AddButton(
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryChips(List<Category> categories) {
    return Wrap(
      spacing: 14,
      children: categories
          .map(
            (e) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selected = e;
                });
              },
              child: Chip(
                shape: StadiumBorder(side: BorderSide(color: Colors.teal)),
                backgroundColor:
                    (e == selected) ? Colors.teal[600] : Colors.grey[900],
                elevation: 10,
                label: Text(
                  e.name,
                  style: subTitleStyle,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
