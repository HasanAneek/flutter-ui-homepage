import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://prohandy.xgenious.com/api/v1/';

  Future<List<dynamic>> _fetchData(String endpoint, String key) async {
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body is Map<String, dynamic> &&
          body.containsKey(key) &&
          body[key] is List) {
        return body[key];
      } else {
        throw Exception(
          'Failed to parse $endpoint: Invalid format. Expected key "$key" with a list.',
        );
      }
    } else {
      throw Exception(
        'Failed to load $endpoint. Status code: ${response.statusCode}',
      );
    }
  }

  Future<List<dynamic>> fetchFeaturedServices() async {
    return _fetchData('service/featured', 'all_services');
  }

  Future<List<dynamic>> fetchProviderLists() async {
    return _fetchData('provider-lists', 'provider_lists');
  }

  Future<List<dynamic>> fetchSliderLists() async {
    return _fetchData('slider-lists', 'sliders');
  }

  Future<List<dynamic>> fetchCategories() async {
    return _fetchData('categories', 'categories');
  }
}
