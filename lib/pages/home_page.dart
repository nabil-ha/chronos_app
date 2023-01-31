import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
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
          CurvedAppBar(
            widget: Stack(
              children: const [
                Positioned(
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 45,
                  ),
                  top: 40,
                  left: 10,
                ),
                Positioned(
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
                    "Nabil",
                    style: titleStyle,
                  ),
                ),
                Positioned(
                    top: 200,
                    left: 30,
                    child: Text(
                      "Your expenses\nchanged by",
                      style: subHeadStyle,
                    )),
                Positioned(
                  top: 200,
                  left: 250,
                  child: Text(
                    "+ 25%",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.redAccent,
                      fontFamily: "Merriweather",
                    ),
                  ),
                ),
                Positioned(
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
        ],
      ),
    );
  }
}
