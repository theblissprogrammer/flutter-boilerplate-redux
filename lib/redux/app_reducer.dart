import 'package:app/models/product_model.dart';

import "app_actions.dart";
import "app_state.dart";
import "authentication/auth_reducer.dart";
import "push/push_reducer.dart";
import "user/user_reducer.dart";
import "package:redux/redux.dart";

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
///
final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, OnProductsLoaded>(_onProductsLoaded),
  TypedReducer<AppState, OnProductsCompleted>(_onProductsCompleted),
  ...authReducers,
  ...userReducers,
  ...pushReducers,
]);

AppState _onProductsLoaded(AppState state, OnProductsLoaded action) {
  return state.rebuild((a) {
    a.productsCompleted = false;
    if (action.refresh != null && action.refresh) {
      a.products.replace(action.products);
    } else {
      a.products.addAll(action.products);
    }
    return a;
  });
}

AppState _onProductsCompleted(AppState state, OnProductsCompleted action) {
  return state.rebuild((a) => a..productsCompleted = true);
}