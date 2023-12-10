import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.green[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 50,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.lightGreen,
              fontSize: 50,
            ),
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.category, required this.value});

  final String category, value;

  final TextStyle smallBold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  final TextStyle smallNormal = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
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
          style: smallBold,
        )
      ],
    );
  }
}
