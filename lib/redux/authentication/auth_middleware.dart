import 'package:app/utils/platform_exception_alert_dialog.dart';
import "package:app/data/user_repository.dart";
import "package:app/redux/app_state.dart";
import "package:app/redux/app_actions.dart";
import "package:app/redux/authentication/auth_actions.dart";
import "package:app/redux/stream_subscriptions.dart";
import "package:app/app/routes.dart";
import "package:app/utils/logger.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:app/utils/platform_exception_alert_dialog.dart';
import "package:redux/redux.dart";
import "package:flutter/services.dart";

/// Authentication Middleware
/// LogIn: Logging user in
/// LogOut: Logging user out
/// VerifyAuthenticationState: Verify if user is logged in

List<Middleware<AppState>> createAuthenticationMiddleware(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return [
    TypedMiddleware<AppState, VerifyAuthenticationState>(
        _verifyAuthState(userRepository, navigatorKey)),
    TypedMiddleware<AppState, EmailLogIn>(_authLogin(userRepository, navigatorKey)),
    TypedMiddleware<AppState, LogOutAction>(
        _authLogout(userRepository, navigatorKey)),
  ];
}

void Function(
  Store<AppState> store,
  VerifyAuthenticationState action,
  NextDispatcher next,
) _verifyAuthState(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) {
    next(action);

    /*userRepository.getAuthenticationStateChange().listen((user) {
      if (user == null) {
        navigatorKey.currentState.pushReplacementNamed(Routes.login);
      } else {
        store.dispatch(OnAuthenticated(user: user));
        store.dispatch(ConnectToDataSource());
      }
    });*/
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogout(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      await userRepository.logOut();
      cancelAllSubscriptions();
      store.dispatch(OnLogoutSuccess());
    } catch (e) {
      PlatformExceptionAlertDialog(
        title: "Error Logging Out",
        exception: e,
      ).show(action.context);

      Logger.w("Failed logout", e: e);
      store.dispatch(OnLogoutFail(e));
    }
  };
}

void Function(
    Store<AppState> store,
    EmailLogIn action,
    NextDispatcher next,
    ) _authLogin(
    UserRepository userRepository,
    GlobalKey<NavigatorState> navigatorKey,
    ) {
  return (store, action, next) async {
    next(action);
    try {
      await userRepository.signIn(action.email, action.password);
      await navigatorKey.currentState.pushReplacementNamed(Routes.home);
      action.completer.complete();
    } on PlatformException catch (e) {
      Logger.w("Failed login", e: e);
      action.completer.completeError(e);
    }
  };
}