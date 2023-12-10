import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title});

  final String title;

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
            onPressed: () {},
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
}

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
