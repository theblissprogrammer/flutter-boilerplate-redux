import 'package:flutter/material.dart';
import 'package:app/data/data_repository.dart';
import "app_actions.dart";
import "app_state.dart";
import "stream_subscriptions.dart";
import "package:app/utils/logger.dart";
import "package:redux/redux.dart";

/// Middleware is used for a variety of things.
/// Including:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createStoreMiddleware(
  DataRepository dataRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return [
    LoggerMiddleware(),
    //TypedMiddleware<AppState, LoadProducts>(_loadProducts(dataRepository)),
  ];
}