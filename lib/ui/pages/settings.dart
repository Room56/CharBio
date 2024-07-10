// lib/ui/pages/settings.dart
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../main.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: StoreConnector<AppState, VoidCallback>(
          converter: (Store<AppState> store) {
            return () => store.dispatch(ToggleThemeAction());
          },
          builder: (context, callback) {
            return ElevatedButton(
              onPressed: callback,
              child: Text('Toggle Theme'),
            );
          },
        ),
      ),
    );
  }
}
