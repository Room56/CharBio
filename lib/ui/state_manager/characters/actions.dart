import 'package:flutter_application_1/data/models/character.dart';


class FetchCharacters {}

class LoadCharactersAction {
  final List<Character> characters;

  LoadCharactersAction(this.characters);
}

class LoadCharactersFailureAction {
  final String error;

  LoadCharactersFailureAction(this.error);
}
