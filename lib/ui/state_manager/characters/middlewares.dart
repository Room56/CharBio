import 'package:redux/redux.dart';
import 'actions.dart';
import 'states.dart';
import 'package:flutter_application_1/data/repositories/character_repository.dart';
import 'package:flutter_application_1/domain/di/injection.dart';

List<Middleware<CharacterState>> createCharacterMiddleware() {
  final repository = locator<CharacterRepository>();

  return [
    TypedMiddleware<CharacterState, FetchCharacters>(_fetchCharacters(repository)),
  ];
}

Middleware<CharacterState> _fetchCharacters(CharacterRepository repository) {
  return (Store<CharacterState> store, action, NextDispatcher next) async {
    next(action);

    try {
      final characters = await repository.getCharacters();
      store.dispatch(CharacterState.loaded(characters));
    } catch (e) {
      store.dispatch(CharacterState.error(e.toString()));
    }
  };
}
