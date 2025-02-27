import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cheers_app/main.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/pages/search/components/identifier_fields.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MainApp();
  }

  group('search page form', () {
    testWidgets('SearchPage displays search form with all inputs', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byKey(const Key('search_page')), findsOneWidget);
      expect(find.byKey(const Key('search_form')), findsOneWidget);

      // address inputs
      expect(find.byKey(const Key('address_row')), findsOneWidget);
      expect(find.byKey(const Key('city_input')), findsOneWidget);
      expect(find.byKey(const Key('state_input')), findsOneWidget);
      expect(find.byKey(const Key('country_input')), findsOneWidget);
      expect(find.byKey(const Key('postal_input')), findsOneWidget);

      // identifier inputs
      expect(find.byKey(const Key('by_type_input')), findsOneWidget);
      expect(find.byKey(const Key('by_name_input')), findsOneWidget);

      // sort inputs
      expect(find.byKey(const Key('number_input')), findsOneWidget);
      expect(find.byKey(const Key('sort_order_input')), findsOneWidget);
    });

    testWidgets('Typing in address inputs updates the search page state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      const testCity = 'Test City';
      const testState = 'Test State';
      const testCountry = 'Test Country';
      const testPostal = '12345';

      final cityFinder = find.byKey(const Key('city_input'));
      final stateFinder = find.byKey(const Key('state_input'));
      final countryFinder = find.byKey(const Key('country_input'));
      final postalFinder = find.byKey(const Key('postal_input'));

      await tester.enterText(cityFinder, testCity);
      await tester.enterText(stateFinder, testState);
      await tester.enterText(countryFinder, testCountry);
      await tester.enterText(postalFinder, testPostal);

      await tester.pumpAndSettle();

      final cityField = tester.widget<TextFormField>(cityFinder);
      final stateField = tester.widget<TextFormField>(stateFinder);
      final countryField = tester.widget<TextFormField>(countryFinder);
      final postalField = tester.widget<TextFormField>(postalFinder);

      expect(cityField.controller!.text, equals(testCity));
      expect(stateField.controller!.text, equals(testState));
      expect(countryField.controller!.text, equals(testCountry));
      expect(postalField.controller!.text, equals(testPostal));
    });
  });

  testWidgets('updates identifier state when a dropdown value is selected', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IdentifierFieldsState()),
        ],
        child: const MaterialApp(home: Scaffold(body: IdentifierFields())),
      ),
    );

    const type = 'Type1';
    const name = 'Name1';

    final identifierState = Provider.of<IdentifierFieldsState>(
      tester.element(find.byType(IdentifierFields)),
      listen: false,
    );

    final typeFinder = find.byKey(const Key('by_type_input'));
    final nameFinder = find.byKey(const Key('by_name_input'));

    await tester.tap(typeFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.text(type).last);
    await tester.pumpAndSettle();

    expect(identifierState.selectedType, equals(type));

    await tester.tap(nameFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.text(name).last);
    await tester.pumpAndSettle();

    expect(identifierState.selectedName, equals(name));
  });
}
