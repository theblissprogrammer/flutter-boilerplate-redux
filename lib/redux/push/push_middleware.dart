import "dart:io";

import "package:app/data/user_repository.dart";
import "package:app/redux/app_actions.dart";
import "package:app/redux/app_state.dart";
import "package:app/redux/authentication/auth_actions.dart";
import "package:app/redux/push/push_actions.dart";
import "package:app/utils/logger.dart";
import "package:redux/redux.dart";

List<Middleware<AppState>> createPushMiddleware(
  UserRepository userRespository,
) {
  return [
    TypedMiddleware<AppState, UpdateUserTokenAction>(
        _updateUserAction(userRespository)),
    TypedMiddleware<AppState, OnAuthenticated>(
        _setTokenAfterLogin(userRespository)),
  ];
}

void Function(
  Store<AppState> store,
  UpdateUserTokenAction action,
  NextDispatcher next,
) _updateUserAction(UserRepository userRepository) {
  return (store, action, next) async {
    next(action);
    try {
      await userRepository.updateUserToken(action.token);
    } catch (e) {
      Logger.e("Failed to update token", e: e, s: StackTrace.current);
    }
  };
}

void Function(
  Store<AppState> store,
  OnAuthenticated action,
  NextDispatcher next,
) _setTokenAfterLogin(UserRepository userRepository) {
  return (store, action, next) async {
    next(action);
    try {
      /// Set the token after the user is authenticated if the token exists
      if (store.state.fcmToken != null) {
        await userRepository.updateUserToken(store.state.fcmToken);
      }
    } catch (e) {
      Logger.e("Failed to update token", e: e, s: StackTrace.current);
    }
  };
}
