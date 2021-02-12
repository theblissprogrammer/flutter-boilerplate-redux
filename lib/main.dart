import 'package:app/app/app.dart';
import 'package:app/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'redux/app_state.dart';

void main() async {
  configureLogger();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (!kIsWeb) {
    // Create Persistor
    final persistor = Persistor<AppState>(
      storage: FlutterStorage(), // Or use other engines
      serializer: JsonSerializer<AppState>(
          AppState.fromJson), // Or use other serializers
    );

    // Load initial state
    final initialState = await persistor.load();

    // Save global variables
    StoreUtils.persistor = persistor;
    StoreUtils.initialState = initialState;
  }

  runApp(MyApp());
}