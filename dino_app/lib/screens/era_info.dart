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
      appBar: AppBar(
        title: Text("Era Select",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen[300],
            )),
        backgroundColor: Colors.green[900],
        toolbarHeight: 100,
        iconTheme: IconThemeData(size: 50, color: Colors.lightGreen[300]),
      ),
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                hspace,
                Text(
                  era.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.green[900],
                  ),
                ),
                hspace,
                Image(
                  image: NetworkImage(era.imageURL),
                ),
                hspace,
                InfoRow(category: "Duration: ", value: "${era.start}BC - ${era.end}BC"),
                hspace,
                Text(
                  era.description,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.green[900],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
