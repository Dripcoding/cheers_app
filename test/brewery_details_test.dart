import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/models/brewery.dart';
import 'package:cheers_app/pages/brewery/brewery_details.dart';

void main() {
  group('BreweryDetailsPage widget test', () {
    final dummyBrewery = Brewery(
      id: 'dummy',
      name: 'Test Brewery',
      breweryType: 'micro',
      address1: '123 Test St',
      address2: null,
      address3: null,
      city: 'Test City',
      stateProvince: 'Test State',
      postalCode: '00000',
      country: 'Test Country',
      longitude: '10.0',
      latitude: '20.0',
      phone: '123456789',
      websiteUrl: 'http://test.com',
      state: 'Test State',
      street: 'Test Street',
    );

    testWidgets('renders active brewery details', (WidgetTester tester) async {
      final breweriesState = BreweriesState();
      breweriesState.setActiveBrewery(dummyBrewery);

      await tester.pumpWidget(
        ChangeNotifierProvider<BreweriesState>.value(
          value: breweriesState,
          child: const MaterialApp(home: BreweryDetailsPage()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(dummyBrewery.name), findsOneWidget);
      expect(find.textContaining(dummyBrewery.city), findsOneWidget);
      expect(find.textContaining(dummyBrewery.state), findsOneWidget);
    });

    testWidgets('renders fallback when no active brewery', (
      WidgetTester tester,
    ) async {
      final breweriesState = BreweriesState();

      await tester.pumpWidget(
        ChangeNotifierProvider<BreweriesState>.value(
          value: breweriesState,
          child: const MaterialApp(home: BreweryDetailsPage()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("No active brewery selected."), findsOneWidget);
    });
  });
}
