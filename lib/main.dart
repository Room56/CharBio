// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'ui/pages/characters/characters_screen.dart';
import 'ui/state_manager/characters/reducers.dart';
import 'ui/state_manager/characters/middlewares.dart';
import 'ui/state_manager/characters/states.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(characterState: CharacterState.initial()),
    middleware: []
      ..addAll(createCharacterMiddleware()),
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CharactersScreen(),
      ),
    );
  }
}
