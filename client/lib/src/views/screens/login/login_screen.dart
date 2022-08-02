import 'package:betify_client/src/core/config/theme/color_constants.dart';
import 'package:betify_client/src/core/config/theme/my_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Icon(
              Icons.sports,
              color: ColorConstants.primaryText,
              size: 50,
            ),
            Text(
              'BETIFY',
              style: MyTheme.headerTextStyle(),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _emailFormField(),
                  _passwordFormField(),
                  _loginButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailFormField() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(
            Icons.mail,
            color: ColorConstants.primaryText,
          ),
        ),
        style: MyTheme.primaryTextStyle(),
        keyboardType: TextInputType.emailAddress,
      );

  Widget _passwordFormField() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(
            Icons.lock,
            color: ColorConstants.primaryText,
          ),
        ),
        style: MyTheme.primaryTextStyle(),
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
      );

  Widget _loginButton() => ElevatedButton(
        onPressed: () {},
        child: Text('Login'),
      );
}
