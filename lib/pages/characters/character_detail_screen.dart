import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/characters/characters_screen.dart';
import 'package:flutter_application_1/classes/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  CharacterDetailScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(character.image, width: 100, height: 100),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    character.status,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Species: ${character.species}',
              style: TextStyle(fontSize: 16),
            ),
            // Add more later
          ],
        ),
      ),
    );
  }
}