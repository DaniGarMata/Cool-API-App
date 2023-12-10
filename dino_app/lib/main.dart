import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/api/api.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:dino_app/screens/dino_info_screen.dart';
import 'package:dino_app/screens/welcome_page.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome', // Set the initial route to the welcome page
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/menu': (context) => MenuScreen(api: DinosaurApi()), // Use your main menu screen here
      },
    );
  }
}

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
              try {
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
              } catch (e) {
                // Handle API error
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
                dino: Dinosaur.fromJson(dinosaurs[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectDinoScreen(dinosaurs: dinosaurs),
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
  final Dinosaur dino;
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
          dino.commonName,
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

class InfoRow extends StatelessWidget {
  InfoRow({Key? key, required this.category, required this.value})
      : super(key: key);

  final String category, value;

  final TextStyle smallBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.green,
  );
  final TextStyle smallNormal = TextStyle(
    fontSize: 20,
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          category,
          style: smallBold,
        ),
        Text(
          value,
          style: smallNormal,
        )
      ],
    );
  }
}