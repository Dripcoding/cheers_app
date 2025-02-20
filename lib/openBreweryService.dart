import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:cheers_app/models/brewery.dart';
import 'dart:convert';

class OpenBreweryService {
  static final BASE_URL = 'https://api.openbrewerydb.org/v1';
  static final _logger = Logger();

  static Future<Brewery> getBreweries(Map<String, String>? queryParams) async {
    final url = Uri.https(BASE_URL, '/breweries', queryParams);
    try {
      _logger.i('Fetching breweries from $url');
      final response = await http.get(url);
      _logger.i('Response ${response.body}');
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      return Brewery.fromJson(decoded);
    } catch (error) {
      _logger.e('Exception caught: $error');
      throw Exception('Failed to fetch breweries due to an error');
    }
  }
}
