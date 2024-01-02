import 'package:flutter/material.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:dino_app/models/era.dart';

class EraInfoScreen extends StatelessWidget {
  const EraInfoScreen({super.key, required this.era});

  final Era era;

  @override
  Widget build(BuildContext context) {
    const hspace = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleBar(title: era.name, backPage: "select_era"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                hspace,
                Align(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
