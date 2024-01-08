import 'dart:convert';
import 'package:dino_app/models/dinosaur.dart';
import 'package:http/http.dart' as http;

class DinosaurApi {
  final String apiUrl;

  DinosaurApi(this.apiUrl);

  Future<List<Dinosaur>> fetchDinosaurs() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((dinoData) => Dinosaur.fromJson(dinoData)).toList();
      } else {
        throw Exception('Failed to load dinosaurs. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load dinosaurs: $e');
    }
  }
}