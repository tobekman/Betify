import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../register_services.dart';
import '../../../core/common/data_state.dart';
import '../../../core/common/mixins/validation_mixin.dart';
import '../../../core/common/params/login_params.dart';
import '../../../core/config/routes/routes.dart';
import '../../../core/config/theme/color_constants.dart';
import '../../../core/config/theme/my_theme.dart';
import '../../../domain/models/users/storage/logged_in_user.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/snackbars.dart';

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
              Navigator.pushNamed(context, Routes.registerView);
            },
            child: Text(
              ' Create account',
              style: MyTheme.linkTextStyle(),
            ),
          ),
        ],
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
    final response = await locator<AuthController>().login(
      LoginParams(
        email: email,
        password: password,
      ),
    );
    if (response is DataSuccess) {
      Hive.box('userBox').add(LoggedInUser.fromUser(response.data!));
      Navigator.pushReplacementNamed(context, Routes.startingView);
    }
    if (response is DataFailed) {
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBars.defaultSnackbar(response.error.toString()));
    }
  }

  void _toggleVisiblePassword() {
    setState(() {
      passwordIsVisible = !passwordIsVisible;
    });
  }
}
