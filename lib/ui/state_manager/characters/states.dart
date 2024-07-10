import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_1/data/models/character.dart';

part 'states.freezed.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = _Initial;
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.loaded(List<Character> characters) = _Loaded;
  const factory CharacterState.error(String message) = _Error;
}
