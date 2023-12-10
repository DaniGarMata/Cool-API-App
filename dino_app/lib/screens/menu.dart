import 'package:flutter/material.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:dino_app/screens/select_dino.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBar(title: "Dino App Menu"),
          const SizedBox(height: 20),
          // Add your menu items here
          MenuItem(
            title: "Select Dino",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectDinoScreen(),
                ),
              );
            },
          ),
          // Add more menu items as needed
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MenuItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
             color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}