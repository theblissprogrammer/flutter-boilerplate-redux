import "package:built_collection/built_collection.dart";
import 'package:app/redux/serializers.dart';
import 'package:built_value/serializer.dart';
import "package:built_value/built_value.dart";
import 'package:app/models/product_model.dart';
import 'package:app/models/user.dart';

// ignore: prefer_double_quotes
part 'app_state.g.dart';


/// This class holds the whole application state.
/// Which can include:
/// - user calendar
/// - current user profile
/// - joined channels
/// - received messages
/// - etc.
///
abstract class AppState implements Built<AppState, AppStateBuilder> {
  /// Serializer field makes the built_value serializable.
  static Serializer<AppState> get serializer => _$appStateSerializer;

  @nullable
  User get user;

  BuiltList<ProductModel> get products;

  @nullable
  bool get productsCompleted;

  @nullable
  String get fcmToken;

  //UiState get uiState;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.init() => AppState((a) => a
    ..products = ListBuilder()
  );

  AppState clear() {
    // keep the temporal fcm token even when clearing state
    // so it can be set again on login.
    //
    // Add here anything else that also needs to be carried over.
    return AppState.init().rebuild((s) => s
      ..fcmToken = fcmToken
    );
  }

  // Decode Json to AppState
  static AppState fromJson(dynamic json) {
    return json == null ? AppState.init() : serializers.deserialize(json);
  }

  // Encode to json
  dynamic toJson(){
    return serializers.serialize(this);
  }
}
