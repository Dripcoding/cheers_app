import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/pages/search/components/sort_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cheers_app/main.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/pages/search/components/identifier_fields.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/SortFieldsState.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

import 'open_brewery_service_test.mocks.dart';

@GenerateMocks([http.Client])
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
      final client = MockClient();
      when(
        client.get(
          Uri.https(
            'api.openbrewerydb.org',
            '/v1/breweries/autocomplete',
            null,
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          jsonEncode([
            {'name': 'name1'},
          ]),
          200,
        ),
      );

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

    testWidgets('clear button clears address input fields', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final cityFinder = find.byKey(const Key('city_input'));
      final stateFinder = find.byKey(const Key('state_input'));
      final countryFinder = find.byKey(const Key('country_input'));
      final postalFinder = find.byKey(const Key('postal_input'));

      await tester.enterText(cityFinder, 'Test City');
      await tester.enterText(stateFinder, 'Test State');
      await tester.enterText(countryFinder, 'Test Country');
      await tester.enterText(postalFinder, '12345');
      await tester.pumpAndSettle();

      expect(
        tester.widget<TextFormField>(cityFinder).controller!.text,
        equals('Test City'),
      );
      expect(
        tester.widget<TextFormField>(stateFinder).controller!.text,
        equals('Test State'),
      );
      expect(
        tester.widget<TextFormField>(countryFinder).controller!.text,
        equals('Test Country'),
      );
      expect(
        tester.widget<TextFormField>(postalFinder).controller!.text,
        equals('12345'),
      );

      final clearButtonFinder = find.byKey(const Key('clear_form_button'));
      expect(clearButtonFinder, findsOneWidget);
      await tester.tap(clearButtonFinder);
      await tester.pumpAndSettle();

      expect(
        tester.widget<TextFormField>(cityFinder).controller!.text,
        isEmpty,
      );
      expect(
        tester.widget<TextFormField>(stateFinder).controller!.text,
        isEmpty,
      );
      expect(
        tester.widget<TextFormField>(countryFinder).controller!.text,
        isEmpty,
      );
      expect(
        tester.widget<TextFormField>(postalFinder).controller!.text,
        isEmpty,
      );
    });
  });

  testWidgets('updates identifier state when a dropdown value is selected', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IdentifierFieldsState()),
          ChangeNotifierProvider(create: (_) => BreweriesState()),
        ],
        child: const MaterialApp(home: Scaffold(body: IdentifierFields())),
      ),
    );

    const type = 'micro';

    final identifierState = Provider.of<IdentifierFieldsState>(
      tester.element(find.byType(IdentifierFields)),
      listen: false,
    );

    final typeFinder = find.byKey(const Key('by_type_input'));
    await tester.tap(typeFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.text(type).last);
    await tester.pumpAndSettle();

    expect(identifierState.selectedType, equals(type));
  });

  testWidgets('updates sort fields state when sort input vaues are changed', (
    WidgetTester tester,
  ) async {
    final sortFieldsState = SortFieldsState();
    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => sortFieldsState)],
        child: const MaterialApp(home: Scaffold(body: SortFields())),
      ),
    );

    final numberInputFinder = find.byKey(const Key('number_input'));
    expect(numberInputFinder, findsOneWidget);

    const testNumber = '42';
    await tester.enterText(numberInputFinder, testNumber);
    await tester.pumpAndSettle();

    expect(sortFieldsState.numberOfBreweries, equals(testNumber));

    final ascRadioFinder = find.widgetWithText(RadioListTile<String>, 'asc');
    expect(ascRadioFinder, findsOneWidget);
    await tester.tap(ascRadioFinder);
    await tester.pumpAndSettle();

    expect(sortFieldsState.sortOrder, equals('asc'));

    final descRadioFinder = find.widgetWithText(RadioListTile<String>, 'desc');
    await tester.tap(descRadioFinder);
    await tester.pumpAndSettle();
    expect(sortFieldsState.sortOrder, equals('desc'));
  });

  testWidgets('Search button is disabled when no input is provided', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final searchButtonFinder = find.byKey(const Key('search_brewery_button'));
    expect(searchButtonFinder, findsOneWidget);

    final searchButton = tester.widget<FilledButton>(searchButtonFinder);
    expect(searchButton.enabled, isFalse);
  });

  testWidgets('Search button is enabled when input is provided', (
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

    final searchButtonFinder = find.byKey(const Key('search_brewery_button'));
    expect(searchButtonFinder, findsOneWidget);

    final searchButton = tester.widget<FilledButton>(searchButtonFinder);
    expect(searchButton.enabled, isTrue);
  });

  testWidgets('name input is disabled by default', (WidgetTester tester) async {
    final breweriesState = BreweriesState();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IdentifierFieldsState()),
          ChangeNotifierProvider<BreweriesState>.value(value: breweriesState),
        ],
        child: const MaterialApp(home: Scaffold(body: IdentifierFields())),
      ),
    );
    await tester.pumpAndSettle();

    final nameInputFieldFinder = find.byKey(const Key('by_name_input'));
    expect(nameInputFieldFinder, findsOneWidget);

    final DropdownButtonFormField<String> nameInputField = tester.widget(
      nameInputFieldFinder,
    );
    expect(nameInputField.onChanged, isNull);
  });
}
