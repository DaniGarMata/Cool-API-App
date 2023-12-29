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
          const EraButton(name: "Triassic", screen: "idk"),
          Container(height: 1, width: 200, color: Colors.green[900]),
          const EraButton(name: "Jurassic", screen: "idk"),
          Container(height: 1, width: 200, color: Colors.green[900]),
          const EraButton(name: "Cretaceous", screen: "idk"),
          ElevatedButton(
            onPressed: () async {
              try {
                final dinosaurNames = await api.fetchDinosaurs();
                if (dinosaurNames.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectDinoScreen(
                        dinosaurNames: dinosaurNames,
                        api: api,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('No Dinosaurs'),
                      content: const Text('There are no dinosaurs available.'),
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
              } catch (error) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Failed to load dinosaurs. Please try again later.'),
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
            child: const Text("Select Dino"),
          ),
        ],
      ),
    );
  }
}