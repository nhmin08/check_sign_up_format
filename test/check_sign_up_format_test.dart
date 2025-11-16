import 'package:check_sign_up_format/regular_expression.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:check_sign_up_format/check_sign_up_format.dart';

void main() {
  test('adds one to input values', () {
    //final validator = Validator();

    expect(
      Validator.nameValidator(
        value: "김철수",
        customCheck: (value) {
          if (RegularExpression(
            condition: Condition.specialCharacter,
          ).validate(value)) {
            return false;
          } else {
            return true;
          }
        },
      ),
      null,
    );
    expect(Validator.idValidator(value: "test"), null);
    expect(Validator.emailValidator(value: "test@test.com"), null);
    expect(Validator.passwordValidator(value: "qwer1234!"), null);
    expect(
      Validator.verifyPasswordValidator(
        value: "qwer1234!",
        password: "qwer1234!",
      ),
      null,
    );
    expect(Validator.phoneNumValidator(value: '01012341234'), null);
  });
}
