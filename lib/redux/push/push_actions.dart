class UpdateUserTokenAction {
  final String token;

  UpdateUserTokenAction(this.token);
}

class OnPushNotificationOpenAction {
  final Map<String, dynamic> message;

  OnPushNotificationOpenAction(this.message);
}

class OnPushNotificationReceivedAction {
  final Map<String, dynamic> message;

  OnPushNotificationReceivedAction(this.message);
}

class OnPushNotificationDismissedAction {}
