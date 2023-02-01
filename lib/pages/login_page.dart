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
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        children: [
          CurvedAppBar(
              // title: "",
              // height: 130,
              ),
          Image.asset("assets/icons/logo.png"),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Column(
              children: [
                getTextField(
                  title: "Username",
                  icon: Icons.person_outline,
                  onChanged: (p0) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                getTextField(
                    title: "Password",
                    isHidden: true,
                    onChanged: (p0) {},
                    icon: Icons.lock_outline),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          loginButton(
              context: context,
              onPressed: () async {
                // await loginUser("nabil", "NaPiL");
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              }),
          const SizedBox(
            height: 20,
          ),
          loginButton(
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
