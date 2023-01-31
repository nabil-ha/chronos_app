import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

class PersonalDebtsTab extends StatefulWidget {
  const PersonalDebtsTab({Key? key}) : super(key: key);

  @override
  State<PersonalDebtsTab> createState() => _PersonalDebtsTabState();
}

class _PersonalDebtsTabState extends State<PersonalDebtsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(,itemBuilder: itemBuilder),
    );
  }
}
