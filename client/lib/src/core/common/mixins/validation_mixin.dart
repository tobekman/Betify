abstract class ValidationMixin {
  String? validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    const pattern = r'(?=.*?[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,16}$';
    final regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'You need to provide a password';
    }

    if (!regExp.hasMatch(value)) {
      return 'Password needs uppercase, lowercase and number';
    }
    return null;
  }

  String? validateRepeatPassword(String value, String password) {
    if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  String? validateDisplayName(String value) {
    if (value.isEmpty) {
      return 'You need to provide a display name';
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'You need to provide a username';
    }
    return null;
  }

  String? validateFieldEmpty(String value) {
    if (value.isEmpty) {
      return 'You need to provide a password';
    }
    return null;
  }
}
