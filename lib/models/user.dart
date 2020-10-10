import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";
import 'package:built_value/serializer.dart';

// ignore: prefer_double_quotes
part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  /// Serializer field makes the built_value serializable.
  static Serializer<User> get serializer => _$userSerializer;

  String get uid;

  @nullable
  String get email;

  @nullable
  String get name;

  @nullable
  DateTime get lastSeenAt;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;
}
