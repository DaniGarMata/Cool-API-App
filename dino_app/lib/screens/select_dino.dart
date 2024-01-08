import 'package:dino_app/api/api.dart';
import 'package:dino_app/models/dinosaur.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectDinoScreen extends StatefulWidget {
  final DinosaurApi api;
  final String era;

  const SelectDinoScreen({Key? key, required this.api, required this.era}) : super(key: key);

  @override
  State<SelectDinoScreen> createState() => _SelectDinoScreenState();
}

class _SelectDinoScreenState extends State<SelectDinoScreen> {
  List<Dinosaur> dinosaurs = [];

  @override
  void initState() {
    super.initState();
    fetchRandomDinosaurs();
  }

  Future<void> fetchRandomDinosaurs() async {
    try {
      final List<Dinosaur> allDinosaurs = await widget.api.fetchDinosaurs();
      final List<Dinosaur> randomDinosaurs = List.from(allDinosaurs)
        ..shuffle()
        ..take(5); // Change 5 to the desired number of random dinosaurs

      setState(() {
        dinosaurs = randomDinosaurs;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        title: Text("${widget.era} Dinosaurs"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dinosaurs.length,
              itemBuilder: (context, index) {
                final dino = dinosaurs[index];
                return DinoListItem(dino: dino);
              },
            ),
          ),
        ],
      ),
    );
  }
}