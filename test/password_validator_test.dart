import 'package:flutter_application_1/core/password_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Password validator',
    () {
      final validator = PasswordValidator();
      test('Correct password returns true', () {
        const mock = 'Checkшшш23{llllllll';
        final res = validator.validate(mock);
        expect(res, true);
      });
      test('No upper latin fails', () {
        const mock = 'heckшшш23{llllllll';
        final res = validator.validate(mock);
        expect(res, false);
      });
      test('No lower ciril fails', () {
        const mock = 'Check23{llllllll';
        final res = validator.validate(mock);
        expect(res, false);
      });
      test('No number fails', () {
        const mock = 'Checkшшш{llllllll';
        final res = validator.validate(mock);
        expect(res, false);
      });
      test('No special fails', () {
        const mock = 'Checkшшш23llllllll';
        final res = validator.validate(mock);
        expect(res, false);
      });
      test('Not valid length fails', () {
        const mock = 'Chkш2{';
        final res = validator.validate(mock);
        expect(res, false);
      });
    },
  );
}
