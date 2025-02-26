import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:cheers_app/models/brewery.dart';
import 'dart:convert';

class OpenBreweryService {
  static final BASE_URL = 'api.openbrewerydb.org';
  static final _logger = Logger();

  static Future<List<Brewery>> getBreweries(
    Map<String, String?>? queryParams,
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

  static Future<List<String>> getBreweryNames(
    Map<String, String?>? queryParams,
    http.Client client,
  ) async {
    final filteredQueryParams =
        queryParams?.entries
            .where(
              (entry) => entry.value != null && entry.value!.trim().isNotEmpty,
            )
            .map((entry) => MapEntry(entry.key, entry.value!))
            .toList();

    final queryString =
        filteredQueryParams != null
            ? filteredQueryParams
                .map((entry) => Uri.encodeComponent(entry.value))
                .join('&')
            : '';

    final urlString =
        'https://$BASE_URL/v1/breweries/autocomplete?query=$queryString';
    final url = Uri.parse(urlString);

    try {
      _logger.i('Fetching brewery names from $url');
      final response = await client.get(url);
      _logger.i('Response ${response.body}');
      final List<dynamic> decoded = jsonDecode(response.body);
      return decoded.map((item) => item['name'].toString()).toList();
    } catch (error) {
      _logger.e('Exception caught: $error');
      throw Exception('Failed to fetch brewery names due to an error');
    }
  }
}
