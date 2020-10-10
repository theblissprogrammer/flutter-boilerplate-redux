import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

import '../redux/app_state.dart';

class StoreUtils {
  static Store<AppState> store;
  static BuildContext globalContext;
  static AppState initialState;
  static Persistor<AppState> persistor;
}