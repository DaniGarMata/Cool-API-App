import 'dart:convert';
import 'package:http/http.dart' as http;

class DinosaurApi {
  final String apiUrl;

  DinosaurApi(this.apiUrl);

  Future<List<String>> fetchDinosaurs() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return List<String>.from(data[0]);
      } else {
        throw Exception('Failed to load dinosaurs. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load dinosaurs: $e');
    }
  }

  fetchDinosaurNames() {}

  fetchDinosaur(String dinoName) {}
}