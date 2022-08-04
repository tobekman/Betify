import 'package:flutter/material.dart';

import '../../../../../register_services.dart';
import '../../../../core/common/data_state.dart';
import '../../../../core/common/mixins/validation_mixin.dart';
import '../../../../core/common/params/register_params.dart';
import '../../../../core/config/theme/color_constants.dart';
import '../../../../core/config/theme/my_theme.dart';
import '../../../controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  final displayName = TextEditingController();
  final username = TextEditingController();
  bool passwordIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.background,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create an account',
              style: MyTheme.headerTextStyle(),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 85,
                    child: _emailFormField(),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 85,
                    child: _displayNameFormField(),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 85,
                    child: _usernameFormField(),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 85,
                    child: _passwordFormField(),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 85,
                    child: _repeatPasswordFormField(),
                  ),
                  const SizedBox(height: 10),
                  _registerButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayNameFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: displayName,
          decoration: const InputDecoration(
            labelText: 'Display name',
            prefixIcon: Icon(
              Icons.mail,
              color: ColorConstants.primaryText,
            ),
          ),
          style: MyTheme.primaryTextStyle(),
          validator: (value) => validateDisplayName(value!),
        ),
      );

  Widget _usernameFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: username,
          decoration: const InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(
              Icons.mail,
              color: ColorConstants.primaryText,
            ),
          ),
          style: MyTheme.primaryTextStyle(),
          validator: (value) => validateUsername(value!),
        ),
      );

  Widget _emailFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: email,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(
              Icons.mail,
              color: ColorConstants.primaryText,
            ),
          ),
          style: MyTheme.primaryTextStyle(),
          keyboardType: TextInputType.emailAddress,
          validator: (value) => validateEmail(value!),
        ),
      );

  Widget _passwordFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: password,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(
              Icons.lock,
              color: ColorConstants.primaryText,
            ),
            suffixIcon: !passwordIsVisible
                ? _passwordToggleButton(Icons.visibility)
                : _passwordToggleButton(Icons.visibility_off),
          ),
          style: MyTheme.primaryTextStyle(),
          obscureText: passwordIsVisible ? false : true,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) => validatePassword(value!),
        ),
      );

  Widget _repeatPasswordFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: repeatPassword,
          decoration: InputDecoration(
            labelText: 'Repeat password',
            prefixIcon: const Icon(
              Icons.lock,
              color: ColorConstants.primaryText,
            ),
            suffixIcon: !passwordIsVisible
                ? _passwordToggleButton(Icons.visibility)
                : _passwordToggleButton(Icons.visibility_off),
          ),
          style: MyTheme.primaryTextStyle(),
          obscureText: passwordIsVisible ? false : true,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) => validateRepeatPassword(value!, password.text),
        ),
      );

  Widget _registerButton() => Padding(
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
          onPressed: () {
            final isValid = _formKey.currentState!.validate();
            if (isValid) {
              _formKey.currentState!.save();
              _register();
            }
          },
          child: const Text(
            'Sign Up',
          ),
        ),
      );

  SnackBar _registerSnackbar(String message) => SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 15,
            overflow: TextOverflow.clip
          ),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: ColorConstants.appBar,
        elevation: 1000,
        behavior: SnackBarBehavior.floating,
      );

  IconButton _passwordToggleButton(IconData icon) => IconButton(
        onPressed: () {
          _toggleVisiblePassword();
        },
        icon: Icon(
          icon,
          color: ColorConstants.primaryText,
        ),
      );

  void _register() async {
    final response = await getIt<AuthController>().register(
      RegisterParams(
        displayName: displayName.text,
        username: username.text,
        email: email.text,
        password: password.text,
      ),
    );

    if (response is DataSuccess) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_registerSnackbar('Account created'));
      Navigator.pop(context);
    }

    if (response is DataFailed) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_registerSnackbar(response.error.toString()));
    }
  }

  void _toggleVisiblePassword() {
    setState(() {
      passwordIsVisible = !passwordIsVisible;
    });
  }
}
