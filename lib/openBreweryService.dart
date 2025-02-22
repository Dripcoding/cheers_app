import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:cheers_app/models/brewery.dart';
import 'dart:convert';

class OpenBreweryService {
  static final BASE_URL = 'api.openbrewerydb.org';
  static final _logger = Logger();

  static Future<List<Brewery>> getBreweries(
    Map<String, String>? queryParams,
    http.Client client,
  ) async {
    final url = Uri.https(BASE_URL, '/v1/breweries', queryParams);
    try {
      _logger.i('Fetching breweries from $url');
      final response = await client.get(url);
      _logger.i('Response ${response.body}');
      final List<dynamic> decoded = jsonDecode(response.body);
      return decoded.map((json) => Brewery.fromJson(json)).toList();
    } catch (error) {
      _logger.e('Exception caught: $error');
      throw Exception('Failed to fetch breweries due to an error');
    }
  }
}
