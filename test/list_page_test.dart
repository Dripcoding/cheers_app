import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/models/brewery.dart';
import 'package:cheers_app/pages/list/list.dart';

void main() {
  testWidgets('ListPage renders a card for each brewery item', (
    WidgetTester tester,
  ) async {
    // Create dummy brewery items.
    final brewery1 = Brewery(
      id: '1',
      name: 'Brewery One',
      breweryType: 'micro',
      address1: 'Address 1',
      address2: null,
      address3: null,
      city: 'CityOne',
      stateProvince: 'StateOne',
      postalCode: '11111',
      country: 'CountryOne',
      longitude: '0.0',
      latitude: '0.0',
      phone: '1234567890',
      websiteUrl: 'http://breweryone.com',
      state: 'StateOne',
      street: 'Street One',
    );
    final brewery2 = Brewery(
      id: '2',
      name: 'Brewery Two',
      breweryType: 'regional',
      address1: 'Address 2',
      address2: null,
      address3: null,
      city: 'CityTwo',
      stateProvince: 'StateTwo',
      postalCode: '22222',
      country: 'CountryTwo',
      longitude: '1.0',
      latitude: '1.0',
      phone: '0987654321',
      websiteUrl: 'http://brewerytwo.com',
      state: 'StateTwo',
      street: 'Street Two',
    );

    final breweriesState = BreweriesState();
    breweriesState.addBreweries([brewery1, brewery2]);

    await tester.pumpWidget(
      ChangeNotifierProvider<BreweriesState>.value(
        value: breweriesState,
        child: const MaterialApp(home: ListPage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Card), findsNWidgets(2));

    expect(find.text(brewery1.name), findsOneWidget);
    expect(find.text(brewery2.name), findsOneWidget);
  });

  testWidgets('ListPage has a back button', (WidgetTester tester) async {
    final breweriesState = BreweriesState();

    await tester.pumpWidget(
      ChangeNotifierProvider<BreweriesState>.value(
        value: breweriesState,
        child: const MaterialApp(home: ListPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('back_button')), findsOneWidget);
  });
}
