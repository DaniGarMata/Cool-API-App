import 'dart:convert';

class Dinosaur {
  String commonName, scientificName, era, dietType, description, placeOfDiscovery, imageURL;
  double weight, height;

  Dinosaur({
    required this.commonName,
    required this.scientificName,
    required this.era,
    required this.dietType,
    required this.description,
    required this.placeOfDiscovery,
    required this.imageURL,
    required this.weight,
    required this.height,
  });

  factory Dinosaur.fromJson(Map<String, dynamic> json) {
    return Dinosaur(
      commonName: json['name'],
      scientificName: json['scientific_name'],
      era: json['era'],
      dietType: json['diet'],
      description: json['description'],
      placeOfDiscovery: json['found'],
      imageURL: json['image'],
      weight: json['weight'].toDouble(),
      height: json['height'].toDouble(),
    );
  }
}
Future<List<Dinosaur>> fetchDinosaurs() async {
  var http;
  final response = await http.get(Uri.parse('https://dinoipsum.com/api/?format=json'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((dinoData) => Dinosaur.fromJson(dinoData)).toList();
  } else {
    throw Exception('Failed to load dinosaurs');
  }
}