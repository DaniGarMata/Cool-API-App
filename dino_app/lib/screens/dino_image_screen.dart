import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DinoImageScreen extends StatelessWidget {
  final Dinosaur dino;

  const DinoImageScreen({Key? key, required this.dino, required dinosaurNames, required DinosaurApi api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const hspace = SizedBox(height: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text("Era Select",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen[300],
            )),
        backgroundColor: Colors.green[900],
        toolbarHeight: 100,
        iconTheme: IconThemeData(size: 50, color: Colors.lightGreen[300]),
      ),
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                hspace,
                // Image should be big
                Image(
                  image: NetworkImage(dino.imageURL),
                ),
                hspace,
                Text(
                  dino.commonName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.green[900],
                  ),
                ),
                Text(
                  dino.scientificName,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    color: Colors.green[900],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}