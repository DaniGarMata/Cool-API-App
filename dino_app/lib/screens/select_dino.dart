import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/screens/dino_info_screen.dart';  // Import the DinoInfoScreen
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectDinoScreen extends StatefulWidget {
  final DinosaurApi api;
  final String era;
  final List<List<String>> eraDinos;

  const SelectDinoScreen({
    Key? key,
    required this.api,
    required this.era,
    required this.eraDinos,
  }) : super(key: key);

  @override
  State<SelectDinoScreen> createState() => _SelectDinoScreenState();
}

class _SelectDinoScreenState extends State<SelectDinoScreen> {
  String dietSelected = "Any";
  
  get dino => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        title: Text("${widget.era} dinos"),
        backgroundColor: Colors.green[900],
        toolbarHeight: 100,
        iconTheme: IconThemeData(size: 50, color: Colors.lightGreen[300]),
        titleTextStyle: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.lightGreen[300],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.eraDinos.length,
              itemBuilder: (context, index) {
                final dinoList = widget.eraDinos[index];
                return DinoListItem(
                  dino: Dinosaur(
                    commonName: dinoList[0],
                    scientificName: dinoList[1],
                    era: widget.era,
                    dietType: dinoList[2],
                    description: dinoList[3],
                    placeOfDiscovery: dinoList[4],
                    imageURL: dinoList[5],
                    weight: double.parse(dinoList[6]),
                    height: double.parse(dinoList[7]),
                  ),
                  // Add onTap functionality to navigate to DinoInfoScreen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DinoInfoScreen( dino: dino,
              dinoList: dinoList,
                          
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}