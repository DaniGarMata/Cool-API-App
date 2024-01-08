import 'package:dino_app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';

import '../screens/dino_info_screen.dart';

class InfoRow extends StatelessWidget {
  InfoRow({super.key, required this.category, required this.value});

  final String category, value;

  final TextStyle smallBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.green[900],
  );
  final TextStyle smallNormal = TextStyle(
    fontSize: 20,
    color: Colors.green[900],
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          category,
          style: smallBold,
        ),
        Text(
          value,
          style: smallNormal,
        )
      ],
    );
  }
}

class EraButton extends StatelessWidget {
  const EraButton({Key? key, required this.name, required this.onTap}) : super(key: key);

  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.green[900],
          ),
        ),
      ),
    );
  }
}

class DinoListItem extends StatelessWidget {
  final Dinosaur dino;
  final List<String>? dinoList;  // Add this line

  DinoListItem({
    required this.dino,
    Key? key,
    this.dinoList,  // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(dino.commonName),
      subtitle: Text(dino.scientificName),
      // Add onTap to navigate to DinoInfoScreen
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DinoInfoScreen(
              dino: dino,
              dinoList: dinoList,
            ),
          ),
        );
      },
    );
  }
}
class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Found"),
      ),
      body: Center(
        child: Text(
          "Page not found!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class DinosaurListScreen extends StatelessWidget {
  final DinosaurApi api;

  const DinosaurListScreen({Key? key, required this.api, required List<String> dinoList, required List eraDinos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinosaur List"),
      ),
      body: Center(
        child: Text(
          "This is the Dinosaur List Screen!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}