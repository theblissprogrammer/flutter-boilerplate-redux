
import "package:app/data/firestore_paths.dart";
import "package:app/models/user.dart";
import 'dart:async';

import 'package:flutter/cupertino.dart';

class UserRepository {
  static const NAME = "name";
  static const EMAIL = "email";
  static const UID = "uid";
  static const TOKEN = "token";
  static const LOCALE = "locale";

  UserRepository();

  Stream<User> getUserStream(userId) {

  }

  Stream<User> getAuthenticationStateChange() {

  }

  Future<User> signIn(String email, String password) async {

  }

  Future<void> logOut() async {
    await updateUserToken(null);

  }

  Future<void> updateUserToken(String token) async {

  }

  // Sets a users locale on our backend.
  // The locale is used to send localized notifications.
  Future<void> updateUserLocale(String locale) async {

  }


  static toMap(User user) {
    return {
      UID: user.uid,
      NAME: user.name,
      EMAIL: user.email,
    };
  }
}
