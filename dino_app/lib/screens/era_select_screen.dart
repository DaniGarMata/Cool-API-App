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
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Do we have to make a screen for each era? How do we differentiate when calling?
          const Expanded(
              child: EraButton(name: "Triassic", screen: "select_dino")),
          Container(height: 1, width: 200, color: Colors.green[900]),
          const Expanded(
              child: EraButton(name: "Jurassic", screen: "select_dino")),
          Container(height: 1, width: 200, color: Colors.green[900]),
          const Expanded(
              child: EraButton(name: "Cretaceous", screen: "select_dino")),
        ],
      ),
    );
  }
}
