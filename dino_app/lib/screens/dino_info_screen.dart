import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DinoInfoScreen extends StatelessWidget {
  final Dinosaur dino;

  const DinoInfoScreen({Key? key, required this.dino, required dinosaurNames, required DinosaurApi api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const hspace = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBar(title: "Dino Info Page", backPage: "select_dino",),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                hspace,
                Text(
                  dino.commonName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.green[900],
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
                GestureDetector(
                  onTap: (Navigator.pushReplacementNamed(context, '/dino_image');)
                  child:
                  Image(
                  image: NetworkImage(dino.imageURL),
                ),
                )
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
                  value: dino.placeOfDiscovery,
                ),
                GestureDetector(
                  onTap: (Navigator.pushReplacementNamed(context, '/era_info');),
                  child:
                    InfoRow(category: "Era: ", value: dino.era), 
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}