// lib/ui/state_manager/app_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'characters/states.dart'; // Импортируйте ваш CharacterState

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required CharacterState characterState,
    // добавьте другие состояния, если необходимо
  }) = _AppState;
}
