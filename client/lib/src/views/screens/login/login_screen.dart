import 'package:betify_client/src/core/config/routes/routes.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sports,
              color: ColorConstants.primaryText,
              size: 100,
            ),
            Text(
              'BETIFY',
              style: MyTheme.headerTextStyle(),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _emailFormField(),
                  const SizedBox(height: 10),
                  _passwordFormField(),
                  const SizedBox(height: 10),
                  _loginButton(),
                  const SizedBox(height: 25),
                  _register(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(
              Icons.mail,
              color: ColorConstants.primaryText,
            ),
          ),
          style: MyTheme.primaryTextStyle(),
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget _passwordFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
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
        ),
      );

  Widget _loginButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 60)),
            backgroundColor: MaterialStateProperty.all<Color>(
              ColorConstants.primary,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              MyTheme.buttonTextStyle(),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Sign In',
          ),
        ),
      );

  Widget _register() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not a member?',
            style: MyTheme.primaryTextStyle(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.registerScreen);
            },
            child: Text(
              ' Register Now',
              style: MyTheme.linkTextStyle(),
            ),
          ),
        ],
      );
}
