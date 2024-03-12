import 'package:flutter_test/flutter_test.dart';

import 'package:check_sign_up_format/check_sign_up_format.dart';

void main() {
  test('adds one to input values', () {
    //final validator = Validator();

    expect(Validator.nameValidator("김철수"), null);
    expect(Validator.idValidator("test"), null);
    expect(Validator.emailValidator("test@test.com"), null);
    expect(Validator.passwordValidator("qwer1234!"), null);
    expect(Validator.verifyPasswordValidator("qwer1234!", "qwer1234!"), null);
    expect(Validator.phoneNumValidator('01012341234'), null);
  });
}
