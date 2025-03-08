import 'package:flutter_test/flutter_test.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/models/brewery.dart';

void main() {
  group('BreweriesState', () {
    late BreweriesState state;

    setUp(() {
      state = BreweriesState();
    });

    test('Initial breweriesList is empty', () {
      expect(state.breweriesList, isEmpty);
    });

    test('addBreweries replaces breweries correctly instead of appending', () {
      final brewery1 = Brewery(
        id: '1',
        name: 'Brewery 1',
        breweryType: 'small',
        address1: 'Address 1',
        address2: null,
        address3: null,
        city: 'City 1',
        stateProvince: 'State 1',
        postalCode: '00000',
        country: 'Country 1',
        longitude: '0.0',
        latitude: '0.0',
        phone: '123',
        websiteUrl: 'http://example.com',
        state: 'State 1',
        street: 'Street 1',
      );
      final brewery2 = Brewery(
        id: '2',
        name: 'Brewery 2',
        breweryType: 'medium',
        address1: 'Address 2',
        address2: null,
        address3: null,
        city: 'City 2',
        stateProvince: 'State 2',
        postalCode: '11111',
        country: 'Country 2',
        longitude: '1.0',
        latitude: '1.0',
        phone: '456',
        websiteUrl: 'http://example2.com',
        state: 'State 2',
        street: 'Street 2',
      );
      final brewery3 = Brewery(
        id: '3',
        name: 'Brewery 3',
        breweryType: 'large',
        address1: 'Address 3',
        address2: null,
        address3: null,
        city: 'City 3',
        stateProvince: 'State 3',
        postalCode: '22222',
        country: 'Country 3',
        longitude: '2.0',
        latitude: '2.0',
        phone: '789',
        websiteUrl: 'http://example3.com',
        state: 'State 3',
        street: 'Street 3',
      );

      state.addBreweries([brewery1]);
      expect(state.breweriesList.length, equals(1));
      expect(state.breweriesList[0].name, equals('Brewery 1'));

      state.addBreweries([brewery2, brewery3]);

      expect(state.breweriesList.length, equals(2));
      expect(state.breweriesList[0].name, equals('Brewery 2'));
      expect(state.breweriesList[1].name, equals('Brewery 3'));

      expect(
        state.breweriesList.where((brewery) => brewery.id == '1').isEmpty,
        isTrue,
        reason: 'Brewery 1 should have been replaced, not appended',
      );
    });

    test('notifyListeners is called on addBreweries', () {
      int listenerCalled = 0;
      state.addListener(() {
        listenerCalled++;
      });
      final brewery = Brewery(
        id: '1',
        name: 'Brewery 1',
        breweryType: 'small',
        address1: 'Address 1',
        address2: null,
        address3: null,
        city: 'City 1',
        stateProvince: 'State 1',
        postalCode: '00000',
        country: 'Country 1',
        longitude: '0.0',
        latitude: '0.0',
        phone: '123',
        websiteUrl: 'http://example.com',
        state: 'State 1',
        street: 'Street 1',
      );
      state.addBreweries([brewery]);
      expect(listenerCalled, equals(1));
    });

    test('setActiveBrewery sets the active brewery correctly', () {
      final dummyBrewery = Brewery(
        id: 'dummy',
        name: 'Test Brewery',
        breweryType: 'micro',
        address1: '',
        address2: null,
        address3: null,
        city: 'Test City',
        stateProvince: 'Test State',
        postalCode: '',
        country: '',
        longitude: '0.0',
        latitude: '0.0',
        phone: '',
        websiteUrl: '',
        state: 'Test State',
        street: '',
      );

      final breweriesState = BreweriesState();

      breweriesState.setActiveBrewery(dummyBrewery);

      expect(breweriesState.activeBrewery, equals(dummyBrewery));
    });
  });
}
