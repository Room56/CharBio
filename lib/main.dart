import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/characters/characters_screen.dart';
import 'package:flutter_application_1/pages/characters/character_detail_screen.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_application_1/api/character_service.dart';
import 'package:flutter_application_1/classes/character.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/characters',
      routes: {
        '/characters': (context) => CharacterListScreen(),
        '/settings': (context) => Settings(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/characterDetail') {
          final character = settings.arguments as Character;
          return MaterialPageRoute(
            builder: (context) {
              return CharacterDetailScreen(character: character);
            },
          );
        }
        return null;
      },
    );
  }
}