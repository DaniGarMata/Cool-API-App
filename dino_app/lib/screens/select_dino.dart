import 'package:dino_app/api/api.dart';
import 'package:dino_app/screens/dino_info_screen.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectDinoScreen extends StatelessWidget {
  final List<String> dinosaurNames;
  final DinosaurApi api;
  final String era;

  const SelectDinoScreen({Key? key, required this.dinosaurNames, required this.api, required this.era}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(title: "$era list", backPage: "select_era"),
          ListView.builder(
            itemCount: dinosaurNames.length,
            itemBuilder: (context, index) {
              final dinoName = dinosaurNames[index];
              return ListTile(
                title: Text(dinoName),
                // Add onTap to navigate to DinoInfoScreen or perform any action
                onTap: () async {
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
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
