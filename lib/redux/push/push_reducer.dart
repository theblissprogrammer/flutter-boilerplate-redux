import "package:app/redux/app_state.dart";
import "package:app/redux/push/push_actions.dart";
import "package:redux/redux.dart";

final pushReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, UpdateUserTokenAction>(_updateUserAction),
];

AppState _updateUserAction(AppState state, UpdateUserTokenAction action) {
  return state.rebuild((s) => s..fcmToken = action.token);
}
