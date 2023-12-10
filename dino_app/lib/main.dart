import 'package:dino_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuScreen(),
    );
  }
}

class DinoInfoScreen extends StatelessWidget {
  const DinoInfoScreen({Key? key, required this.dino}) : super(key: key);

  final Dinosaur dino;

  @override
  Widget build(BuildContext context) {
    const hspace = SizedBox(height: 10);
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBar(title: "Dino Info Page"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                hspace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dino.commonName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green[900],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dino.scientificName,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      color: Colors.green[900],
                    ),
                  ),
                ),
                hspace,
                Image(
                  image: NetworkImage(dino.imageURL),
                ),
                hspace,
                Text(
                  dino.description,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.green[900],
                  ),
                ),
                hspace,
                InfoRow(category: "Weight: ", value: "${dino.weight}kg"),
                InfoRow(category: "Height: ", value: "${dino.height}m"),
                InfoRow(category: "Diet: ", value: dino.dietType),
                InfoRow(
                    category: "Place of discovery: ",
                    value: dino.placeOfDiscovery),
                InfoRow(category: "Era: ", value: dino.era),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                  builder: (context) => SelectDinoScreen(),
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

class SelectDinoScreen extends StatelessWidget {
  const SelectDinoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBar(title: "Select Dino"),
          const SizedBox(height: 20),
          // Add your list of dinosaurs here
          DinoListItem(
            dino: Dinosaur(
              commonName: "Tyrannosaurus Rex",
              scientificName: "T. Rex",
              era: "Cretaceous",
              dietType: "Carnivore",
              description: "A large dinosaur with short arms and powerful jaws.",
              placeOfDiscovery: "North America",
              imageURL: "https://picsum.photos/250",
              weight: 9000,
              height: 5,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DinoInfoScreen(
                    dino: Dinosaur(
                      commonName: "Tyrannosaurus Rex",
                      scientificName: "T. Rex",
                      era: "Cretaceous",
                      dietType: "Carnivore",
                      description: "A large dinosaur with short arms and powerful jaws.",
                      placeOfDiscovery: "North America",
                      imageURL: "https://picsum.photos/250",
                      weight: 9000,
                      height: 5,
                    ),
                  ),
                ),
              );
            },
          ),
          // Add more dinosaur items as needed
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

class InfoRow extends StatelessWidget {
  InfoRow({Key? key, required this.category, required this.value})
      : super(key: key);

  final String category, value;

  final TextStyle smallBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.green[900],
  );
  final TextStyle smallNormal = TextStyle(
    fontSize: 20,
    color: Colors.green[900],
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