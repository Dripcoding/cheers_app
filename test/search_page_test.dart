import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cheers_app/main.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MainApp();
  }

  testWidgets('SearchPage displays search form with all inputs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byKey(const Key('search_page')), findsOneWidget);
    expect(find.byKey(const Key('search_form')), findsOneWidget);
    expect(find.byKey(const Key('city_input')), findsOneWidget);
    expect(find.byKey(const Key('state_input')), findsOneWidget);
    expect(find.byKey(const Key('country_input')), findsOneWidget);
    expect(find.byKey(const Key('postal_input')), findsOneWidget);
  });
}
