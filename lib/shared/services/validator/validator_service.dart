class ValidatorService {
  static String? containNumber(String? value) {
    if (value == null || value.isEmpty) {
      return '값을 입력해주세요.';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return '숫자를 포함해야 합니다.';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력해주세요.';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다.';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (value.length < 8) {
      return '비밀번호는 8자 이상이어야 합니다.';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
      return '비밀번호는 문자와 숫자를 포함해야 합니다.';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return '이름을 입력해주세요.';
    }
    if (value.length < 2) {
      return '이름은 2자 이상이어야 합니다.';
    }
    return null;
  }

  static String? team(String? value) {
    if (value == null || value.isEmpty) {
      return '팀 이름을 입력해주세요.';
    }
    if (value.length < 2) {
      return '팀 이름은 2자 이상이어야 합니다.';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return '전화번호를 입력해주세요.';
    }
    if (!RegExp(r'^010-?\d{4}-?\d{4}$').hasMatch(value)) {
      return '올바른 전화번호 형식이 아닙니다. (예: 010-1234-5678)';
    }
    return null;
  }

  static String? fax(String? value) {
    if (value == null || value.isEmpty) {
      return '팩스 번호를 입력해주세요.';
    }
    if (!RegExp(r'^\d{2,3}-\d{3,4}-\d{4}$').hasMatch(value)) {
      return '올바른 팩스 번호 형식이 아닙니다. (예: 02-1234-5678)';
    }
    return null;
  }
}
