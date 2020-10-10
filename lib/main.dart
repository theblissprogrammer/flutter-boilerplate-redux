import 'package:app/app/app.dart';
import 'package:app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'redux/app_state.dart';
import 'utils/store_util.dart';

void main() async {
  configureLogger();

  WidgetsFlutterBinding.ensureInitialized();

  // Create Persistor
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(), // Or use other engines
    serializer: JsonSerializer<AppState>(AppState.fromJson), // Or use other serializers
  );

  // Load initial state
  final initialState = await persistor.load();

  // Save global variables
  StoreUtils.persistor = persistor;
  StoreUtils.initialState = initialState;

  runApp(MyApp());
}