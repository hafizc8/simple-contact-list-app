import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_contact_app/main.dart' as app;
import 'function.dart';

void main() {
  ///
  /// Command for test
  /// flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/app_test.dart
  ///
  group('end-to-end test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('verify data is stored ..', (WidgetTester tester) async {
      print("Start testing verify data is stored or not ..");
      // load app
      app.main();

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Check contact page is opened
      print("Check contact page is opened");
      await MyFunction().pumpUntilFound(tester, find.text('Manage Contacts'));

      // Verifiy data is during called
      print("Verifiy data is during called");
      expect(find.byKey(const Key("loadingText")), findsOneWidget);

      // Check data success loaded and find first data
      print("Check data success loaded and find first data");
      await tester.pump(const Duration(seconds: 5));
      await MyFunction().pumpUntilFound(tester, find.byKey(const Key("PERSON_LIST-1")));
      expect(find.byKey(const Key("PERSON_LIST-1")), findsOneWidget);

      print("End testing verify data ..");
    });
  });
}