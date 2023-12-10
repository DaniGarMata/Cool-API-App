import 'package:dino_app/api/api.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:dino_app/screens/select_dino.dart';

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
          TitleBar(title: "Dino App Menu"),
          SizedBox(height: 20),
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
                      title: Text('No Dinosaurs'),
                      content: Text('There are no dinosaurs available.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              } catch (error) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Failed to load dinosaurs. Please try again later.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text("Select Dino"),
          ),
        ],
      ),
    );
  }
}