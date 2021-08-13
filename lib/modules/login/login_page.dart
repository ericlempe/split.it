import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../theme/app_theme.dart';
import 'login_controller.dart';
import 'login_service.dart';
import 'login_state.dart';
import 'widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
      service: LoginServiceImpl(),
    );
    autorun((_) {
      if (controller.state is LoginStateSuccess) {
        final user = (controller.state as LoginStateSuccess).user;
        Navigator.pushReplacementNamed(context, '/home', arguments: user);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Container(
                  width: 236,
                  child: Text(
                    'Divida suas contas com seus amigos',
                    style: AppTheme.textStyles.title,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: ListTile(
                  leading: Image.asset('assets/images/emoji.png'),
                  title: Text("Faça seu login com uma das contas abaixo",
                      style: AppTheme.textStyles.button),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Observer(builder: (context) {
                if (controller.state is LoginStateLoading)
                  return CircularProgressIndicator();
                else if (controller.state is LoginStateFailure)
                  return Text((controller.state as LoginStateFailure).message);
                else
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SocialButton(
                      imagePath: 'assets/images/google.png',
                      label: 'Entrar com Google',
                      onTap: () => controller.googleSignIn(),
                    ),
                  );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
