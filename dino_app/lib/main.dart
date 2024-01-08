import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/screens/dino_info_screen.dart';
import 'package:dino_app/screens/era_select_screen.dart';
import 'package:dino_app/screens/select_dino.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DinosaurApi api = DinosaurApi('your_api_url_here'); // Replace with your actual API URL

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dino App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: EraSelectScreen(api: api),
      routes: {
        '/dino_info': (context) {
          // This part needs to be adjusted based on the selected dinosaur
          var dino2 = null; // Replace with the selected dinosaur
          var dinoList = null; // Replace with the list of dinosaurs if available
          return DinoInfoScreen(
            dino: dino2,
            dinoList: dinoList,
          );
        },
      },
    );
  }
}