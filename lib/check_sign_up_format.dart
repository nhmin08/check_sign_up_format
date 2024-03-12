library check_sign_up_format;

class Validator{
  static nameValidator(String value) {
    if (value.contains(RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'))) {
      return "Invalid name format. Please re-enter your name.";
    }
    return null;
  }

  static idValidator(String value){
    if(!value.contains(RegExp(r'^[a-z0-9]*$'))){
      return "This is not a valid ID format. Please re-enter it.";
    }
    return null;
  }

  static emailValidator(String value) {
    if (!value.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      return "This email is not in a valid format. Please re-enter it.";
    }
    return null;
  }

  static passwordValidator(String value) {
    if (value.length < 8 ||
        !value.contains(RegExp(r'(\d+)')) ||
        !value.contains(RegExp(r'[a-zA-Z]')) ||
        !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Please enter a combination of alphabets, numbers, and special characters.";
    }
    return null;
  }

  static verifyPasswordValidator(String value, String password) {
    if (value != password) {
      return "The password doesn't match.";
    }
    return null;
  }

  static phoneNumValidator(String value) {
    if (!value.contains(RegExp(r'(^\d*$)'))) {
      return "Invalid phone number format, please check and re-enter.";
    }
    return null;
  }
}