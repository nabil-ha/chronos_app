import 'package:chronos/components/buttons/login_button.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/components/textfield.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/pages/home_page.dart';
import 'package:chronos/requests/fetch_data.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: appCubit.isDarkTheme ? Colors.grey[900] : Colors.white,
      body: Column(
        children: [
          CurvedAppBar(
            title: "Login",
          ),
          Image.asset("assets/icons/logo.png"),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Column(
              children: [
                getTextField(title: "Username"),
                const SizedBox(
                  height: 10,
                ),
                getTextField(title: "Password", isHidden: true),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          getLoginButton(
              context: context,
              onPressed: () async {
                // await loginUser("nabil", "NaPiL");
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              }),
          const SizedBox(
            height: 20,
          ),
          getLoginButton(
            context: context,
            icon: Image.asset("assets/icons/nafath.ico"),
            onPressed: () async {
              await fetchTransactions(context);
            },
          ),
        ],
      ),
    );
  }
}
