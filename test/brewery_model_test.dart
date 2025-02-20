import 'package:flutter_test/flutter_test.dart';
import 'package:cheers_app/models/brewery.dart';

void main() {
  final sampleJson = {
    'id': 'ef970757-fe42-416f-931d-722451f1f59c',
    'name': '10 Barrel Brewing Co',
    'brewery_type': 'large',
    'address_1': '1501 E St',
    'address_2': null,
    'address_3': null,
    'city': 'San Diego',
    'state_province': 'California',
    'postal_code': '92101-6618',
    'country': 'United States',
    'longitude': '-117.129593',
    'latitude': '32.714813',
    'phone': '6195782311',
    'website_url': 'http://10barrel.com',
    'state': 'California',
    'street': '1501 E St',
  };

  test('fromJson creates a valid Brewery instance', () {
    final brewery = Brewery.fromJson(sampleJson);
    expect(brewery.id, 'ef970757-fe42-416f-931d-722451f1f59c');
    expect(brewery.name, '10 Barrel Brewing Co');
    expect(brewery.breweryType, 'large');
    expect(brewery.address1, '1501 E St');
    expect(brewery.address2, isNull);
    expect(brewery.address3, isNull);
    expect(brewery.city, 'San Diego');
    expect(brewery.stateProvince, 'California');
    expect(brewery.postalCode, '92101-6618');
    expect(brewery.country, 'United States');
    expect(brewery.longitude, '-117.129593');
    expect(brewery.latitude, '32.714813');
    expect(brewery.phone, '6195782311');
    expect(brewery.websiteUrl, 'http://10barrel.com');
    expect(brewery.state, 'California');
    expect(brewery.street, '1501 E St');
  });

  test('toJson returns a map matching the Brewery instance', () {
    final brewery = Brewery.fromJson(sampleJson);
    final json = brewery.toJson();
    expect(json['id'], brewery.id);
    expect(json['name'], brewery.name);
    expect(json['brewery_type'], brewery.breweryType);
    expect(json['address_1'], brewery.address1);
    expect(json['address_2'], brewery.address2);
    expect(json['address_3'], brewery.address3);
    expect(json['city'], brewery.city);
    expect(json['state_province'], brewery.stateProvince);
    expect(json['postal_code'], brewery.postalCode);
    expect(json['country'], brewery.country);
    expect(json['longitude'], brewery.longitude);
    expect(json['latitude'], brewery.latitude);
    expect(json['phone'], brewery.phone);
    expect(json['website_url'], brewery.websiteUrl);
    expect(json['state'], brewery.state);
    expect(json['street'], brewery.street);
  });
}
