import 'package:dino_app/api/api.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
          Expanded(
            child: EraButton(
              name: "Triassic",
              onTap: () {
                Navigator.pushNamed(context, '/dinosaur_list', arguments: "Triassic");
              },
            ),
          ),
          Container(height: 1, width: 200, color: Colors.green[900]),
          Expanded(
            child: EraButton(
              name: "Jurassic",
              onTap: () {
                Navigator.pushNamed(context, '/dinosaur_list', arguments: "Jurassic");
              },
            ),
          ),
          Container(height: 1, width: 200, color: Colors.green[900]),
          Expanded(
            child: EraButton(
              name: "Cretaceous",
              onTap: () {
                Navigator.pushNamed(context, '/dinosaur_list', arguments: "Cretaceous");
              },
            ),
          ),
        ],
      ),
    );
  }
}