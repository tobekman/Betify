import 'package:betify_client/register_services.dart';
import 'package:betify_client/src/core/common/data_state.dart';
import 'package:betify_client/src/core/common/error_response.dart';
import 'package:betify_client/src/core/common/mixins/validation_mixin.dart';
import 'package:betify_client/src/core/common/params/login_params.dart';
import 'package:betify_client/src/core/config/routes/routes.dart';
import 'package:betify_client/src/core/config/theme/color_constants.dart';
import 'package:betify_client/src/core/config/theme/my_theme.dart';
import 'package:betify_client/src/domain/models/users/storage/logged_in_user.dart';
import 'package:betify_client/src/views/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool passwordIsVisible = false;

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
                  SizedBox(
                    height: 85,
                    child: _emailFormField(),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 85,
                    child: _passwordFormField(),
                  ),
                  _forgotPassword(),
                  const SizedBox(height: 35),
                  _loginButton(),
                  const SizedBox(height: 35),
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
          validator: (value) => validateEmail(value!),
          onSaved: (value) => setState(() => email = value!),
        ),
      );

  Widget _passwordFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
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
          validator: (value) => validateFieldEmpty(value!),
          onSaved: (value) => setState(() => password = value!),
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
          onPressed: () {
            final isValid = _formKey.currentState!.validate();
            if (isValid) {
              _formKey.currentState!.save();
              _login();
            }
          },
          child: const Text(
            'Sign In',
          ),
        ),
      );

  Widget _forgotPassword() => Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            style: MyTheme.linkTextStyle(),
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

  SnackBar _loginSnackbar(String message) => SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 15),
            ),
          ],
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

  void _login() async {
    final response = await getIt<AuthController>().login(
      LoginParams(
        email: email,
        password: password,
      ),
    );
    if (response is DataSuccess) {
      Hive.box('userBox').add(LoggedInUser.fromUser(response.data!));
      Navigator.pushReplacementNamed(context, Routes.startingScreen);
    }
    if (response is DataFailed) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_loginSnackbar(response.error.toString()));
    }
  }

  void _toggleVisiblePassword() {
    setState(() {
      !passwordIsVisible ? passwordIsVisible = true : passwordIsVisible = false;
    });
  }
}
