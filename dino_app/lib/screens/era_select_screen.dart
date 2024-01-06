import 'package:dino_app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:dino_app/screens/select_dino.dart';

class EraSelectScreen extends StatelessWidget {
  final DinosaurApi api;

  const EraSelectScreen({Key? key, required this.api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TitleBar(title: "Era Select", backPage: "welcome",),
          // Do we have to make a screen for each era? How do we differentiate when calling?
          const EraButton(name: "Triassic", screen: "/select_dino"),
          Container(height: 1, width: 200, color: Colors.green[900]),
          const EraButton(name: "Jurassic", screen: "/select_dino"),
          Container(height: 1, width: 200, color: Colors.green[900]),
          const EraButton(name: "Cretaceous", screen: "/select_dino"),
        ],
      ),
    );
  }
}