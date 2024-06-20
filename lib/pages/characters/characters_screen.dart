import 'package:flutter/material.dart';

class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final List<Character> characters = [
    Character('Deadpool', 'assets/deadpool.jpg', true),
    Character('Hulk', 'assets/hulk.jpg', false),
    Character('Iron Man', 'assets/ironman.jpg', false),
    Character('Spider Man', 'assets/spiderman.jpg', false),
    Character('Wolverine', 'assets/wolverine.jpg', false),
    Character('Thor', 'assets/thor.jpg', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(
            character: characters[index],
            onFavoriteToggle: () {
              setState(() {
                characters[index].isFavorite = !characters[index].isFavorite;
              });
            },
          );
        },
      ),
    );
  }
}

class Character {
  String title;
  String imagePath;
  bool isFavorite;

  Character(this.title, this.imagePath, this.isFavorite);
}

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onFavoriteToggle;

  CharacterCard({required this.character, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  character.imagePath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  character.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: character.isFavorite ? Colors.red : null,
                ),
                onPressed: onFavoriteToggle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
