import 'package:flutter_test/flutter_test.dart';

import 'package:check_sign_up_format/check_sign_up_format.dart';

void main() {
  test('adds one to input values', () {
    final validator = Validator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);

    expect(validator.nameValidator("김철수", "이름 에러 메세지"), null);
    expect(validator.idValidator("test", "아이디 에러 메세지"), null);
    expect(validator.emailValidator("test@test.com", "이메일 에러 메세지"), null);
    expect(validator.passwordValidator("qwer1234!", "비밀번호 에러 메세지"), null);
    expect(validator.verifyPasswordValidator("qwer1234!", "qwer1234!", "비밀번호 확인 에러 메세지"), null);
    expect(validator.phoneNumValidator('01012341234', "전화번호 에러 메세지"), null);
  });
}
