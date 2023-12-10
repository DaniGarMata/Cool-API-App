import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:dino_app/main.dart';


class SelectDinoScreen extends StatelessWidget {
  const SelectDinoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBar(title: "Select Dino"),
          const SizedBox(height: 20),
          // Add your list of dinosaurs here
          DinoListItem(
            dino: Dinosaur(
              commonName: "Tyrannosaurus Rex",
              scientificName: "T. Rex",
              era: "Cretaceous",
              dietType: "Carnivore",
              description: "A large dinosaur with short arms and powerful jaws.",
              placeOfDiscovery: "North America",
              imageURL: "https://picsum.photos/250",
              weight: 9000,
              height: 5,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DinoInfoScreen(
                    dino: Dinosaur(
                      commonName: "Tyrannosaurus Rex",
                      scientificName: "T. Rex",
                      era: "Cretaceous",
                      dietType: "Carnivore",
                      description: "A large dinosaur with short arms and powerful jaws.",
                      placeOfDiscovery: "North America",
                      imageURL: "https://picsum.photos/250",
                      weight: 9000,
                      height: 5,
                    ),
                  ),
                ),
              );
            },
          ),
          // Add more dinosaur items as needed
        ],
      ),
    );
  }
}

class DinoListItem extends StatelessWidget {
  final Dinosaur dino;
  final VoidCallback onTap;

  const DinoListItem({Key? key, required this.dino, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(
          dino.commonName,
          style: TextStyle(
            fontSize: 24,
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
