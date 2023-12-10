import 'dart:convert';
import 'package:http/http.dart' as http;

class DinosaurApi {
  static const String apiUrl = 'https://dinoipsum.com/api/?format=json';

  Future<List<Map<String, dynamic>>> fetchDinosaurs() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      print('API response status code: ${response.statusCode}');
      print('API response body: ${response.body}');

      if (response.statusCode == 200) {
        // Check content type
        if (response.headers['content-type']?.toLowerCase().contains('application/json') == true) {
          final List<dynamic> names = json.decode(response.body);
          return names.map((name) => {'name': name}).toList();
        } else {
          print('Unexpected content type: ${response.headers['content-type']}');
          throw Exception('Failed to load dinosaurs');
        }
      } else {
        print('API request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load dinosaurs');
      }
    } catch (e) {
      print('Exception during API request: $e');
      throw Exception('Failed to load dinosaurs');
    }
  }
}