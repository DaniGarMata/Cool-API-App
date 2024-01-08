import 'package:flutter/material.dart';
import 'package:dino_app/models/dinosaur.dart';

/*class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title, required this.backPage});

  final String title, backPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.green[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 50,
              color: Colors.lightGreen[300],
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.lightGreen[300],
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}*/

class InfoRow extends StatelessWidget {
  InfoRow({super.key, required this.category, required this.value});

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

class EraButton extends StatelessWidget {
  const EraButton({super.key, required this.name, required this.screen});

  final String name, screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/$screen');
      },
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.green[900],
          ),
        ),
      ),
    );
  }
}

class DinoListItem extends StatelessWidget {
  const DinoListItem({super.key, required this.dino});

  final Dinosaur dino;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/dino_info');
        },
        child: SizedBox(
            height: 70,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: NetworkImage(dino.imageURL),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          dino.commonName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[900],
                          ),
                        ),
                        Text(
                          dino.scientificName,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            color: Colors.green[900],
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green[900],
                  )
                ],
              ),
            )));
  }
}
