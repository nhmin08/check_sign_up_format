library check_sign_up_format;

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

class Validator{
  nameValidator(String value, String? errorMessage) {
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return errorMessage ?? "Invalid name format. Please re-enter your name.";
    }
    return null;
  }

  idValidator(String value, String? errorMessage){
    if(!value.contains(RegExp(r'^[a-z0-9]*$'))){
      return errorMessage ?? "This is not a valid ID format. Please re-enter it.";
    }
    return null;
  }

  emailValidator(String value, String? errorMessage) {
    if (!value.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      return errorMessage ?? "This email is not in a valid format. Please re-enter it.";
    }
    return null;
  }

  passwordValidator(String value, String? errorMessage) {
    if (value.length < 8 ||
        !value.contains(RegExp(r'(\d+)')) ||
        !value.contains(RegExp(r'[a-zA-Z]')) ||
        !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return errorMessage ?? "Please enter a combination of alphabets, numbers, and special characters.";
    }
    return null;
  }

  verifyPasswordValidator(String value, String password, String errorMessage) {
    if (value != password) {
      return errorMessage ?? "The password doesn't match.";
    }
    return null;
  }

  phoneNumValidator(String value, String errorMessage) {
    if (!value.contains(RegExp(r'(^\d*$)'))) {
      return errorMessage ?? "Invalid phone number format, please check and re-enter.";
    }
    return null;
  }
}