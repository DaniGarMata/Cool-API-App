import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/screens/dino_info_screen.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectDinoScreen extends StatefulWidget {
  final List<String> dinosaurNames;
  final DinosaurApi api;
  final String era;

  const SelectDinoScreen({Key? key, required this.dinosaurNames, required this.api, required this.era}) : super(key: key);

  @override
  State<SelectDinoScreen> createState() => _SelectDinoScreenState();
}

class _SelectDinoScreenState extends State<SelectDinoScreen> {
  String dietSelected = "Any";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(title: "${widget.era} dinos", backPage: "select_era"),
          //Row(children: [Expanded(child: Container(color: Colors.green[900], child: Center(child: DropdownMenu<String>(initialSelection: "Any", controller: TextEditingController(),requestFocusOnTap: true, label: Text("Diet"), onSelected: (String diet) {setState((){dietSelected = diet;});},),)),)],),
          ListView.builder(
            itemCount: widget.dinosaurNames.length,
            itemBuilder: (context, index) {
              final dinoName = widget.dinosaurNames[index];
              return DinoListItem(
                dino: Dinosaur(
                  commonName: "pee", 
                  scientificName: "piss", 
                  era: "lol", 
                  dietType: "peepee", 
                  description: "woaw", 
                  placeOfDiscovery: "aa", 
                  imageURL: "https://picsum.photos/300/200", 
                  weight: 3, 
                  height: 3));}
                // Add onTap to navigate to DinoInfoScreen or perform any action
                /*onTap: () async {
                  try {
                    final dinosaur = await api.fetchDinosaur(dinoName);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          var api2 = null;
                          return DinoInfoScreen(dino: dinosaur, dinosaurNames: null, api: api2,);
                        },
                      ),
                    );
                  } catch (error) {
                    // Handle error, e.g., show an error dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: Text('Failed to load dinosaur information: $error'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  };
                }
              );
            },*/
          ),
        ],
      ),
    );
  }
}
