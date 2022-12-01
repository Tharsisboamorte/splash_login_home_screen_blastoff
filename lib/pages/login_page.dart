import 'package:flutter/material.dart';
import 'package:splash_login_screen/Widget/custom_text_field_widget.dart';
import 'package:splash_login_screen/components/login/custom_login_buttom_component.dart';
import 'package:splash_login_screen/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomTextFieldWidget(
              onChanged: _controller.setLogin,
              label: "Login",
            ),
            CustomTextFieldWidget(
              onChanged: _controller.setPass,
              label: "Senha",
              obscureText: true,
            ),
            const SizedBox(
              height: 35,
            ),
            CustomLoginButtomComponent(loginController: _controller)
          ],
        ),
      ),
    );
  }
}
