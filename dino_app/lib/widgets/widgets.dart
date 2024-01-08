import 'package:dino_app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';

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
  final List<String> dinoList; // Add this line

  const DinoListItem({Key? key, required this.dinoList, required Dinosaur dino}) : super(key: key); // Modify this line

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/dino_info');
      },
      child: SizedBox(
        height: 70,
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: NetworkImage("https://picsum.photos/300/200"), // Change this line as needed
              ),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      dinoList[0], // Change this line to display the appropriate dino information
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green[900],
                      ),
                    ),
                    Text(
                      dinoList[1], // Change this line to display the appropriate dino information
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        color: Colors.green[900],
                      ),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.green[900],
              )
            ],
          ),
        ),
      ),
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