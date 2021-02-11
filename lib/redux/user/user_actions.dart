import "dart:async";

import "package:app/models/user.dart";
import "package:meta/meta.dart";

@immutable
class OnUserUpdateAction {
  final User user;

  const OnUserUpdateAction(this.user);
}

@immutable
class UpdateUserLocaleAction {
  final String locale;

  const UpdateUserLocaleAction(this.locale);
}

class UpdateUserAction {
  final User user;

  final Completer completer;

  UpdateUserAction({this.user, Completer completer})
      : completer = completer ?? Completer();
}
