import 'package:dino_app/screens/dino_info_screen.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';



class SelectDinoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dinosaurs;
  const SelectDinoScreen({Key? key, required this.dinosaurs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBar(title: "Select Dino"),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: dinosaurs.length,
            itemBuilder: (context, index) {
              return DinoListItem(
                dino: dinosaurs[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DinoInfoScreen(
                        dino: dinosaurs[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class DinoListItem extends StatelessWidget {
  final Map<String, dynamic> dino;
  final VoidCallback onTap;

  const DinoListItem({Key? key, required this.dino, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(
          dino['name'],
          style: const TextStyle(
            fontSize: 24,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
