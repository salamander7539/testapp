import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tests_app/common/theme/colors.dart';
import 'package:tests_app/view/mobx/auth.dart';
import 'package:tests_app/view/widgets/switcher.dart';
import 'package:tests_app/view/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Auth auth = Auth();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.bgColor,
      body: Stack(
        children: [
          Stack(
            children: [
              Image.asset('assets/png/wave.png'),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 56.0),
                  child: SvgPicture.asset('assets/svg/logo.svg'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Observer(
                  builder: (context) => IgnorePointer(
                    ignoring: auth.authType[0],
                    child: Opacity(
                      opacity: auth.authType[0] ? 0 : 1,
                      child: AuthTextField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                AuthTextField(
                  hintText: 'Username',
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 12,
                ),
                AuthTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                  onSubmitted: (newValue) async {
                    await auth.startAuth(
                      email: emailController.text,
                      userName: userNameController.text,
                      password: passwordController.text,
                    );
                    userNameController.clear();
                    emailController.clear();
                    passwordController.clear();
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                Switcher(
                    auth: auth,
                    onTap: () {
                      userNameController.clear();
                      emailController.clear();
                      passwordController.clear();
                    }),
                const SizedBox(
                  height: 52,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppTheme.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


