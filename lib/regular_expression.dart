enum Condition {
  isLength8,
  specialCharacter,
  isEmail,
  onlyKor,
  onlyEng,
  onlyLetter,
  isContainUpperCase,
  onlyNumber,
  isContainSpace,
}

class RegularExpression {
  final RegExp _regex;

  // factory 생성자를 통해서만 인스턴스가 생성되도록 강제
  RegularExpression._(this._regex);

  // condition에 따라 다른 정규식을 리턴
  factory RegularExpression({required Condition condition}) {
    switch (condition) {
      case Condition.isLength8:
        // 8자 이상인지
        return RegularExpression._(RegExp(r'^.{8,}$'));
      case Condition.specialCharacter:
        // 특수 문자 포함 여부
        return RegularExpression._(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      case Condition.isEmail:
        // 이메일 형식 확인
        return RegularExpression._(
          RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
          ),
        );
      case Condition.onlyKor:
        // 한국어만
        return RegularExpression._(RegExp(r'^[가-힣]+$'));
      case Condition.onlyEng:
        // 영어만
        return RegularExpression._(RegExp(r'^[a-zA-Z]+$'));
      case Condition.onlyLetter:
        // 영아, 한국어만
        return RegularExpression._(RegExp(r'^[a-zA-Z가-힣\s]+$'));
      case Condition.isContainUpperCase:
        // 대문자 확인
        return RegularExpression._(RegExp(r'[A-Z]'));
      case Condition.onlyNumber:
        // 숫자만
        return RegularExpression._(RegExp(r'^[0-9]+$'));
      case Condition.isContainSpace:
        // 공백 포함 여부
        return RegularExpression._(RegExp(r'\s'));
    }
  }

  /// 유효성 검사 메서드
  bool validate(String value) => _regex.hasMatch(value);
}
