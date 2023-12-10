import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:dino_app/models/dinosaur.dart';

class DinoInfoScreen extends StatelessWidget {
  final Map<String, dynamic> dino;
  
  const DinoInfoScreen({Key? key, required this.dino}) : super(key: key);
  
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
                    dino['name'], // Access the 'name' key from the map
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green[900],
                    ),
                  ),
                ),
                hspace,
                // Add the rest of your UI components here...
              ],
            ),
          ),
        ],
      ),
    );
  }
}