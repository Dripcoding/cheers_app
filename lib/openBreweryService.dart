import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class OpenBreweryService {
  static final BASE_URL = 'https://api.openbrewerydb.org/v1';
  static final _logger = Logger();

  static Future<http.Response> getBreweries() async {
    final url = Uri.parse('$BASE_URL/breweries');
    try {
      _logger.i('Fetching breweries from $url');
      final response = await http.get(url);
      return response;
    } catch (error) {
      _logger.e('Exception caught: $error');
      throw Exception('Failed to fetch breweries due to an error');
    }
  }
}
