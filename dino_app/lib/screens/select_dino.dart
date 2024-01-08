import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectDinoScreen extends StatefulWidget {
  final List<String> dinosaurNames;
  final DinosaurApi api;
  final String era;

  const SelectDinoScreen(
      {Key? key,
      required this.dinosaurNames,
      required this.api,
      required this.era})
      : super(key: key);

  @override
  State<SelectDinoScreen> createState() => _SelectDinoScreenState();
}

class _SelectDinoScreenState extends State<SelectDinoScreen> {
  String dietSelected = "Any";

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
                itemCount: widget.dinosaurNames.length,
                itemBuilder: (context, index) {
                  final dinoName = widget.dinosaurNames[index];
                  return DinoListItem(
                      // This should get the dinos
                      dino: Dinosaur(
                          commonName: "pee",
                          scientificName: "piss",
                          era: "lol",
                          dietType: "peepee",
                          description: "woaw",
                          placeOfDiscovery: "aa",
                          imageURL: "https://picsum.photos/300/200",
                          weight: 3,
                          height: 3));
                }
                
                ),
          ),
        ],
      ),
    );
  }
}
