import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/cubits/app_cubit.dart';
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
      backgroundColor: appCubit.isDarkTheme ? Colors.grey[900] : Colors.white,
      body: Column(
        children: [
          CurvedAppBar(title: "HomePage"),
        ],
      ),
    );
  }
}
