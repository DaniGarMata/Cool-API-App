import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dino_app/models/dinosaur.dart';

class DinosaurApi {
  final String apiUrl;

  DinosaurApi(this.apiUrl);

  Future<List<Dinosaur>> fetchDinosaursByEra(String era) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?era=$era'));

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

  Future<Dinosaur> fetchDinosaur(String dinoName) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?name=$dinoName'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return Dinosaur.fromJson(data);
      } else {
        throw Exception('Failed to load dinosaur. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load dinosaur: $e');
    }
  }
}