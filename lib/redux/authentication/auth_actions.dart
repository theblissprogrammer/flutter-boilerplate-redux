import "dart:async";
import 'package:flutter/material.dart';
import "package:app/models/user.dart";
import "package:meta/meta.dart";

// Authentication
class VerifyAuthenticationState {}

class EmailLogIn {
  final String email;
  final String password;
  final BuildContext context;
  final Completer completer;

  EmailLogIn({this.email, this.password, this.context, Completer completer})
      : completer = completer ?? Completer();
}

@immutable
class OnAuthenticated {
  final User user;

  const OnAuthenticated({@required this.user});

  @override
  String toString() {
    return "OnAuthenticated{user: $user}";
  }
}

class LogOutAction {
  final BuildContext context;

  LogOutAction({this.context,});
}

class OnLogoutSuccess {
  OnLogoutSuccess();

  @override
  String toString() {
    return "LogOut{user: null}";
  }
}

class OnLogoutFail {
  final dynamic error;

  OnLogoutFail(this.error);

  @override
  String toString() {
    return "OnLogoutFail{There was an error logging in: $error}";
  }
}
