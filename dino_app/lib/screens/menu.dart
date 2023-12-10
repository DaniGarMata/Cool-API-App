import 'package:flutter/material.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:dino_app/screens/select_dino.dart';
import 'package:dino_app/api/api.dart';

class MenuScreen extends StatelessWidget {
  final DinosaurApi api;
  const MenuScreen({Key? key, required this.api}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.lightGreen[300],
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleBar(title: "Dino App Menu"),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final dinosaurs = await api.fetchDinosaurs();

            if (dinosaurs.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectDinoScreen(dinosaurs: dinosaurs),
                ),
              );
            } else {
              // Handle the case when there are no dinosaurs
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
          },
          child: const Text("Select Dino"),
        ),
      ],
    ),
  );  // <-- Add this return statement
}
}