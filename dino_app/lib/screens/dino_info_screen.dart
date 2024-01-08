import 'package:flutter/material.dart';
import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart'; // Make sure to import your Dinosaur class

class DinoInfoScreen extends StatelessWidget {
  final DinosaurApi api;
  final Dinosaur dino;
  final List<List<String>> dinosaurNames;

  DinoInfoScreen({
    required this.api,
    required this.dino,
    required this.dinosaurNames,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dino Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${dino.name}'),
            Text('Diet: ${dino.diet}'),
            Text('Period: ${dino.period}'),
            // Add other properties if needed
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dinosaur_list', arguments: dino.period);
              },
              child: Text('Back to Dinosaur List'),
            ),
          ],
        ),
      ),
    );
  }
}