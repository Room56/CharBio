import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/characters/characters_screen.dart';
import 'package:flutter_application_1/pages/settings.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor:Colors.white,
  ),
initialRoute: '/settings',
  routes: {
    '/characters': (context) => CharacterListPage(),
    '/settings': (context) => Settings()
  },
));



