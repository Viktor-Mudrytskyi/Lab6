import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'UI',
    () {
      const incorrectText = 'Incorrect';
      const correctText = 'Correct';
      testWidgets(
        'After tapping validate for valid password correct text appears',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();
          await widgetTester.enterText(
              find.byType(TextField), 'Checkшшш23{llllllll');
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.byType(ElevatedButton));
          await widgetTester.pumpAndSettle();

          final textElement = find.text(correctText);
          expect(textElement, findsOneWidget);
        },
      );
      testWidgets(
        'After tapping validate for invalid password incorrect text appears',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();
          await widgetTester.enterText(
              find.byType(TextField), 'Checkшшш23llllllll');
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.byType(ElevatedButton));
          await widgetTester.pumpAndSettle();

          final textElement = find.text(incorrectText);
          expect(textElement, findsOneWidget);
        },
      );
    },
  );
}
