// lib/ui/state_manager/characters/reducers.dart
import 'package:redux/redux.dart';
import 'states.dart';
import 'actions.dart';

final characterReducer = combineReducers<CharacterState>([
  TypedReducer<CharacterState, LoadCharactersAction>(_loadCharacters),
  TypedReducer<CharacterState, LoadCharactersFailureAction>(_loadCharactersFailure),
]);

CharacterState _loadCharacters(
  CharacterState state,
  LoadCharactersAction action,
) {
  return state.copyWith(
    characters: action.characters,
    isLoading: false,
    error: null,
  );
}

CharacterState _loadCharactersFailure(
  CharacterState state,
  LoadCharactersFailureAction action,
) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, dynamic>((state, action) {
    return state.copyWith(characterState: characterReducer(state.characterState, action));
  }),
]);
