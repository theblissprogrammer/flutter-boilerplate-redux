import 'package:flutter/material.dart';
import "package:app/redux/app_state.dart";
import "package:app/redux/authentication/auth_actions.dart";
import "package:app/redux/stream_subscriptions.dart";
import "package:app/redux/user/user_actions.dart";
import "package:app/utils/logger.dart";
import 'package:app/data/user_repository.dart';
import "package:redux/redux.dart";

List<Middleware<AppState>> createUserMiddleware(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return [
    TypedMiddleware<AppState, OnAuthenticated>(_listenToUser(userRepository)),
    TypedMiddleware<AppState, UpdateUserLocaleAction>(
        _updateUserLocale(userRepository)),
  ];
}

// Updates locale for logged in user.
void Function(
  Store<AppState> store,
  UpdateUserLocaleAction action,
  NextDispatcher next,
) _updateUserLocale(
  UserRepository userRepository,
) {
  return (store, action, next) async {
    next(action);

    try {
      // Updates user locale after login.
      await userRepository.updateUserLocale(action.locale);
    } catch (e) {
      Logger.e("Failed to update locale", e: e, s: StackTrace.current);
    }
  };
}

// Receives updates for the logged in user.
void Function(
  Store<AppState> store,
  OnAuthenticated action,
  NextDispatcher next,
) _listenToUser(
  UserRepository userRepository,
) {
  return (store, action, next) {
    next(action);
    try {
      userUpdateSubscription?.cancel();
      userUpdateSubscription =
          userRepository.getUserStream(action.user.uid).listen((user) {
        store.dispatch(OnUserUpdateAction(user));
      });
    } catch (e) {
      Logger.e("Failed to listen user", e: e, s: StackTrace.current);
    }
  };
}