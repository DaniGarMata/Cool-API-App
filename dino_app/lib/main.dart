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
          commonName: "jerry",
          scientificName: "gerald",
          era: "triassic",
          dietType: "food",
          description: "cool guy",
          placeOfDiscovery: "europe",
          imageURL: "https://picsum.photos/250",
          weight: 20,
          height: 30,
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
    const hspace = SizedBox(height: 10);
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBar(title: "Dino Info Page"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                hspace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dino.commonName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green[900],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dino.scientificName,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      color: Colors.green[900],
                    ),
                  ),
                ),
                hspace,
                Image(
                  image: NetworkImage(dino.imageURL),
                ),
                hspace,
                Text(
                  dino.description,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.green[900],
                  ),
                ),
                hspace,
                InfoRow(category: "Weight: ", value: "${dino.weight}kg"),
                InfoRow(category: "Height: ", value: "${dino.height}m"),
                InfoRow(category: "Diet: ", value: dino.dietType),
                InfoRow(
                    category: "Place of discovery: ",
                    value: dino.placeOfDiscovery),
                InfoRow(category: "Era: ", value: dino.era),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
