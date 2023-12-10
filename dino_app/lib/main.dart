import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DinoInfoScreen(
        dino: Dinosaur(
          commonName: "common name",
          scientificName: "scient name",
          era: "triassic",
          dietType: "food",
          description: "cool guy",
          placeOfDiscovery: "europe",
          imageURL: "https://picsum.photos/300",
          weight: 20.0,
          height: 30.0,
        ),
      ),
    );
  }
}

class DinoInfoScreen extends StatelessWidget {
  const DinoInfoScreen({super.key, required this.dino});

  final Dinosaur dino;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleBar(title: "Dino info page"),
        Text(
          dino.commonName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          dino.scientificName,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
        ),
        Image(
          image: NetworkImage(dino.imageURL),
        ),

      ],
    );
  }
}
