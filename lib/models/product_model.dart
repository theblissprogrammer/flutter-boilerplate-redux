import "package:built_value/built_value.dart";
import 'package:built_value/serializer.dart';

// ignore: prefer_double_quotes
part 'product_model.g.dart';

abstract class ProductModel implements Built<ProductModel, ProductModelBuilder> {
  /// Serializer field makes the built_value serializable.
  static Serializer<ProductModel> get serializer => _$productModelSerializer;

  String get asin;

  @nullable
  String get title;

  @nullable
  String get html;

  @nullable
  String get image;

  @nullable
  String get star;

  @nullable
  int get ratings;

  @nullable
  bool get hasSellers;

  @nullable
  bool get hasBuyBox;

  @nullable
  int get bsr;

  @nullable
  String get category;

  @nullable
  String get domain;

  @nullable
  DateTime get updatedAt;

  ProductModel._();

  factory ProductModel([void Function(ProductModelBuilder) updates]) = _$ProductModel;

  @override
  String toString() {
    return "ASIN: $asin, Title: $title, Sellers: $hasSellers, BuyBox: $hasBuyBox,";
  }
}
