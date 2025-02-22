import 'package:flutter_test/flutter_test.dart';
import 'package:cheers_app/openBreweryService.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

import 'open_brewery_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('OpenBreweryService', () {
    test(
      'getBreweries returns a Brewery list equal to sample JSON data',
      () async {
        final client = MockClient();
        // Sample JSON string matching the Brewery model.
        const sampleJsonString = '''
      [
        {
          "id": "ef970757-fe42-416f-931d-722451f1f59c",
          "name": "10 Barrel Brewing Co",
          "brewery_type": "large",
          "address_1": "1501 E St",
          "address_2": null,
          "address_3": null,
          "city": "San Diego",
          "state_province": "California",
          "postal_code": "92101-6618",
          "country": "United States",
          "longitude": "-117.129593",
          "latitude": "32.714813",
          "phone": "6195782311",
          "website_url": "http://10barrel.com",
          "state": "California",
          "street": "1501 E St"
        }
      ]
      ''';

        when(
          client.get(Uri.https('api.openbrewerydb.org', '/v1/breweries', null)),
        ).thenAnswer((_) async => http.Response(sampleJsonString, 200));

        final breweryList = await OpenBreweryService.getBreweries(null, client);
        final actualJson =
            breweryList.map((brewery) => brewery.toJson()).toList();
        final expectedJson = jsonDecode(sampleJsonString);
        expect(actualJson, equals(expectedJson));
      },
    );
  });
}
