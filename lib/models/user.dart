import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";

// ignore: prefer_double_quotes
part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
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
