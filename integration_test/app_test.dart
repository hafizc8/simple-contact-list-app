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
  /// Initialize
  ///
  final nameField   = find.byKey(const Key("CONTACT_NAME_TEXT"));
  final emailField  = find.byKey(const Key("CONTACT_EMAIL_TEXT"));
  final phoneField  = find.byKey(const Key("CONTACT_PHONE_TEXT"));
  final notesField  = find.byKey(const Key("CONTACT_NOTES_TEXT"));
  final labelField  = find.byKey(const Key("CONTACT_LABEL_TEXT"));
  final btnSave     = find.byKey(const Key("CONTACT_BTN_SAVE"));

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


    testWidgets('add new contact test ..', (WidgetTester tester) async {
      print("Start testing add new contact ..");
      // load app
      app.main();

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Check contact page is opened
      print("Check contact page is opened");
      await MyFunction().pumpUntilFound(tester, find.text('Manage Contacts'));

      // Click button add
      print("Click button add");
      await tester.tap(find.byKey(const Key("BUTTON_TO_ADD_CONTACT")));

      // Check add contact page is opened
      print("Check add contact page is opened");
      await MyFunction().pumpUntilFound(tester, find.text('New Contact'));

      // fill name contact
      await tester.tap(nameField);
      await tester.pumpAndSettle();

      await tester.enterText(nameField, "Hafiz");
      await tester.pumpAndSettle();

      // fill email contact
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, "hafizc8@gmail.com");
      await tester.pumpAndSettle();

      // fill phone contact
      await tester.tap(phoneField);
      await tester.pumpAndSettle();

      await tester.enterText(phoneField, "085275477269");
      await tester.pumpAndSettle();

      // fill notes contact
      await tester.tap(notesField);
      await tester.pumpAndSettle();

      await tester.enterText(notesField, "Flutter Developer");
      await tester.pumpAndSettle();

      // fill label contact
      await tester.tap(labelField);
      await tester.pumpAndSettle();

      await tester.enterText(labelField, "Flutter");
      await tester.pumpAndSettle();

      // tap button save
      await tester.tap(btnSave);
      await tester.pumpAndSettle();

      // Check contact page is opened
      print("Check contact page is opened");
      await MyFunction().pumpUntilFound(tester, find.text('Manage Contacts'));
      await tester.pumpAndSettle();

      // Scroll listview to down
      print("Scroll down list view");
      await tester.drag(find.byKey(const Key('SingleChildScrollKey')), const Offset(0.0, -500));
      await tester.pumpAndSettle();

      // Check data has added
      print("Check data has added");
      expect(find.text("Hafiz"), findsOneWidget);
      expect(find.text("hafizc8@gmail.com"), findsOneWidget);
      expect(find.text("085275477269"), findsOneWidget);

      print("Done testing add new contact ..");
    });
  });
}