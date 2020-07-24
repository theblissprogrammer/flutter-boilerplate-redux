import "dart:async";

import 'package:app/models/product_model.dart';
import "package:app/models/user.dart";

// App user
StreamSubscription<User> userUpdateSubscription;
// List of user's cards
StreamSubscription<List<ProductModel>> productsSubscription;

/// Cancels all active subscriptions
///
/// Called on successful logout.
cancelAllSubscriptions() {
  userUpdateSubscription?.cancel();
  productsSubscription?.cancel();
}