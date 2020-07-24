import "package:built_collection/built_collection.dart";
import "package:app/redux/app_state.dart";
import "package:app/redux/user/user_actions.dart";
import "package:redux/redux.dart";

final userReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, OnUserUpdateAction>(_onUserUpdate),
];

AppState _onUserUpdate(AppState state, OnUserUpdateAction action) {
  return state.rebuild((a) => a
    // Update the app user
    ..user.replace(action.user)
  );
}

