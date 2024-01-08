import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // This should be a random dino image
            image: NetworkImage("https://picsum.photos/1000"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 30),
              Text(
                'Dino App',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              const SizedBox(height: 400),
              FilledButton(
                style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.green[900]),
                    foregroundColor:
                        MaterialStatePropertyAll(Colors.green[900]),
                    overlayColor: MaterialStatePropertyAll(Colors.green[900])),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/select_era');
                },
                child: Text(
                  'Start',
                  style: TextStyle(
                    color: Colors.lightGreen[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                "Dani G., Hèctor G., Oga Y.",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
