import 'package:flutter/material.dart';
import 'package:app/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

class StoreUtils {
  static Store<AppState> store;
  static BuildContext globalContext;
  static AppState initialState;
  static Persistor<AppState> persistor;
}