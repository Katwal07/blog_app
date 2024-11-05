class AppValidators {
  /// Email Validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    RegExp emailRexExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');

    if (!emailRexExp.hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  /// Username Validator
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is Required";
    }

RegExp nameRegExp = RegExp(r"^[A-Za-z]+(?:[-'\s][A-Za-z]+)*$");

    if (!nameRegExp.hasMatch(value)) {
       return "Username can only contain letters, spaces, hyphens, or apostrophes";
    }
    return null;
  }

  /// Password Validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password must me atleast 6 character long";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain atleast one uppercase letter";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain atleast one number";
    }

    if (!value
        .contains(RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
      return "Password must contain atleast one special character";
    }

    return null;
  }

  /// Phone Number Validator
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  /// Confirm Password
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
