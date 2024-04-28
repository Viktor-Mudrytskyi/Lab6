class PasswordValidator {
  bool validate(String password) {
    if (password.length < 9) {
      return false;
    }

    RegExp latinUpperCase = RegExp(r'[A-Z]');
    RegExp cyrillicLowerCase = RegExp(r'[а-я]');
    RegExp digits = RegExp(r'\d');
    RegExp specialChars = RegExp(r'[\{\}\(\):"|\~`\.]');
    int setCount = 0;
    if (latinUpperCase.hasMatch(password)) {
      setCount++;
    }
    if (cyrillicLowerCase.hasMatch(password)) {
      setCount++;
    }
    if (digits.hasMatch(password)) {
      setCount++;
    }
    if (specialChars.hasMatch(password)) {
      setCount++;
    }
    if (setCount < 4) {
      return false;
    }
    return true;
  }
}
