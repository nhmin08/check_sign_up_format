library check_sign_up_format;

import 'package:check_sign_up_format/constant/check_sign_up_constant.dart';

class Validator {
  /// 이름 형식 체크
  static String? nameValidator({
    required String value,
    bool Function(String value)? customCheck,
    String? errorMessage,
  }) {
    if (customCheck != null) {
      bool isCorrect = customCheck(value);

      if (!isCorrect) {
        return errorMessage ?? CheckSignUpConstant.nameErrorMessage;
      }
    } else {
      if (value.contains(RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'))) {
        return errorMessage ?? CheckSignUpConstant.nameErrorMessage;
      }
    }

    return null;
  }

  /// ID 형식 체크
  static idValidator({
    required String value,
    bool Function(String value)? customCheck,
    String? errorMessage,
  }) {
    if (customCheck != null) {
      bool isCorrect = customCheck(value);

      if (!isCorrect) {
        return errorMessage ?? CheckSignUpConstant.idErrorMessage;
      }
    } else {
      if (!value.contains(RegExp(r'^[a-z0-9]*$'))) {
        return errorMessage ?? CheckSignUpConstant.idErrorMessage;
      }
    }
    return null;
  }

  /// email 형식 체크
  static emailValidator({
    required String value,
    bool Function(String value)? customCheck,
    String? errorMessage,
  }) {
    if (customCheck != null) {
      bool isCorrect = customCheck(value);

      if (!isCorrect) {
        return errorMessage ?? CheckSignUpConstant.emailErrorMessage;
      }
    } else {
      if (!value.contains(
        RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ),
      )) {
        return errorMessage ?? CheckSignUpConstant.emailErrorMessage;
      }
    }

    return null;
  }

  /// 비밀번호 형식 체크
  static passwordValidator({
    required String value,
    bool Function(String value)? customCheck,
    String? errorMessage,
  }) {
    if (customCheck != null) {
      bool isCorrect = customCheck(value);

      if (!isCorrect) {
        return errorMessage ?? CheckSignUpConstant.passwordErrorMessage;
      }
    } else {
      if (value.length < 8 ||
          !value.contains(RegExp(r'(\d+)')) ||
          !value.contains(RegExp(r'[a-zA-Z]')) ||
          !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return errorMessage ?? CheckSignUpConstant.passwordErrorMessage;
      }
    }

    return null;
  }

  /// 비밀번호 확인 체크
  static verifyPasswordValidator({
    required String value,
    required String password,
    String? errorMessage,
  }) {
    if (value != password) {
      return errorMessage ?? CheckSignUpConstant.verifyPasswordErrorMessage;
    }
    return null;
  }

  /// 전화번호 체크
  static phoneNumValidator({
    required String value,
    bool Function(String value)? customCheck,
    String? errorMessage,
  }) {
    if (customCheck != null) {
      bool isCorrect = customCheck(value);

      if (!isCorrect) {
        return errorMessage ?? CheckSignUpConstant.emailErrorMessage;
      }
    } else {
      if (!value.contains(RegExp(r'(^\d*$)'))) {
        return errorMessage ?? CheckSignUpConstant.phoneErrorMessage;
      }
    }

    return null;
  }
}
