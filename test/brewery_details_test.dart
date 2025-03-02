import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/models/brewery.dart';
import 'package:cheers_app/pages/brewery/brewery_details.dart';

void main() {
  group('BreweryDetailsPage widget test', () {
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

    testWidgets('renders header with title', (WidgetTester tester) async {
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
