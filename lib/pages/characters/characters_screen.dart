import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/character_service.dart';
import 'package:flutter_application_1/classes/character.dart';
import 'package:flutter_application_1/pages/characters/character_detail_screen.dart';

 class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late Future<List<Character>> futureCharacters;
  final CharacterService _characterService = CharacterService();

  @override
  void initState() {
    super.initState();
    futureCharacters = _characterService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Character>>(
        future: futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No characters found'));
          } else {
            List<Character> characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return CharacterCard(
                  character: characters[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/characterDetail',
                      arguments: characters[index],
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  CharacterCard({required this.character, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Image.network(character.image, width: 50, height: 50),
          title: Text(character.name),
          subtitle: Text(character.species),
        ),
      ),
    );
  }
}