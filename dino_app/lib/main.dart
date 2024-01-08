import 'package:flutter/material.dart';
import 'package:dino_app/screens/era_info.dart';
import 'package:dino_app/screens/era_select_screen.dart';
import 'package:dino_app/screens/select_dino.dart';
import 'package:dino_app/widgets/widgets.dart';
import 'package:dino_app/screens/dino_info_screen.dart';
import 'package:dino_app/screens/welcome_page.dart';
import 'package:dino_app/models/era.dart';
import 'package:dino_app/api/api.dart';

void main() {
  final api = DinosaurApi('https://dinosaur-facts-api.shultzlab.com/dinosaurs');
  runApp(App(api: api));
}

class App extends StatelessWidget {
  final DinosaurApi api;

  const App({Key? key, required this.api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/select_era': (context) => EraSelectScreen(api: api),
        '/select_dino': (context) => SelectDinoScreen(api: api, era: '',),
        '/dino_info': (context) {
          var dino2 = null;
          return DinoInfoScreen(api: api, dino: dino2, dinosaurNames: null);
        },
        '/dino_image': (context) {
          var dino2 = null;
          return DinoInfoScreen(api: api, dino: dino2, dinosaurNames: null);
        },
        '/era_info': (context) => EraInfoScreen(
          era: Era(
            name: "poopassic",
            description: "wow!!",
            start: 22,
            end: 12,
            imageURL: "https://picsum.photos/300/200",
          ),
        ),
        
        
      },
      
    );
  }
}