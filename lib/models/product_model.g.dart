// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductModel extends ProductModel {
  @override
  final String asin;
  @override
  final String title;
  @override
  final String html;
  @override
  final String image;
  @override
  final String star;
  @override
  final int ratings;
  @override
  final bool hasSellers;
  @override
  final bool hasBuyBox;
  @override
  final int bsr;
  @override
  final String category;
  @override
  final String domain;
  @override
  final DateTime updatedAt;
  @override
  final Map<String, double> avgSalesRank;
  @override
  final Map<String, double> avgPrice;

  factory _$ProductModel([void Function(ProductModelBuilder) updates]) =>
      (new ProductModelBuilder()..update(updates)).build();

  _$ProductModel._(
      {this.asin,
      this.title,
      this.html,
      this.image,
      this.star,
      this.ratings,
      this.hasSellers,
      this.hasBuyBox,
      this.bsr,
      this.category,
      this.domain,
      this.updatedAt,
      this.avgSalesRank,
      this.avgPrice})
      : super._() {
    if (asin == null) {
      throw new BuiltValueNullFieldError('ProductModel', 'asin');
    }
  }

  @override
  ProductModel rebuild(void Function(ProductModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductModelBuilder toBuilder() => new ProductModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductModel &&
        asin == other.asin &&
        title == other.title &&
        html == other.html &&
        image == other.image &&
        star == other.star &&
        ratings == other.ratings &&
        hasSellers == other.hasSellers &&
        hasBuyBox == other.hasBuyBox &&
        bsr == other.bsr &&
        category == other.category &&
        domain == other.domain &&
        updatedAt == other.updatedAt &&
        avgSalesRank == other.avgSalesRank &&
        avgPrice == other.avgPrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, asin.hashCode),
                                                        title.hashCode),
                                                    html.hashCode),
                                                image.hashCode),
                                            star.hashCode),
                                        ratings.hashCode),
                                    hasSellers.hashCode),
                                hasBuyBox.hashCode),
                            bsr.hashCode),
                        category.hashCode),
                    domain.hashCode),
                updatedAt.hashCode),
            avgSalesRank.hashCode),
        avgPrice.hashCode));
  }
}

class ProductModelBuilder
    implements Builder<ProductModel, ProductModelBuilder> {
  _$ProductModel _$v;

  String _asin;
  String get asin => _$this._asin;
  set asin(String asin) => _$this._asin = asin;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _html;
  String get html => _$this._html;
  set html(String html) => _$this._html = html;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _star;
  String get star => _$this._star;
  set star(String star) => _$this._star = star;

  int _ratings;
  int get ratings => _$this._ratings;
  set ratings(int ratings) => _$this._ratings = ratings;

  bool _hasSellers;
  bool get hasSellers => _$this._hasSellers;
  set hasSellers(bool hasSellers) => _$this._hasSellers = hasSellers;

  bool _hasBuyBox;
  bool get hasBuyBox => _$this._hasBuyBox;
  set hasBuyBox(bool hasBuyBox) => _$this._hasBuyBox = hasBuyBox;

  int _bsr;
  int get bsr => _$this._bsr;
  set bsr(int bsr) => _$this._bsr = bsr;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _domain;
  String get domain => _$this._domain;
  set domain(String domain) => _$this._domain = domain;

  DateTime _updatedAt;
  DateTime get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime updatedAt) => _$this._updatedAt = updatedAt;

  Map<String, double> _avgSalesRank;
  Map<String, double> get avgSalesRank => _$this._avgSalesRank;
  set avgSalesRank(Map<String, double> avgSalesRank) =>
      _$this._avgSalesRank = avgSalesRank;

  Map<String, double> _avgPrice;
  Map<String, double> get avgPrice => _$this._avgPrice;
  set avgPrice(Map<String, double> avgPrice) => _$this._avgPrice = avgPrice;

  ProductModelBuilder();

  ProductModelBuilder get _$this {
    if (_$v != null) {
      _asin = _$v.asin;
      _title = _$v.title;
      _html = _$v.html;
      _image = _$v.image;
      _star = _$v.star;
      _ratings = _$v.ratings;
      _hasSellers = _$v.hasSellers;
      _hasBuyBox = _$v.hasBuyBox;
      _bsr = _$v.bsr;
      _category = _$v.category;
      _domain = _$v.domain;
      _updatedAt = _$v.updatedAt;
      _avgSalesRank = _$v.avgSalesRank;
      _avgPrice = _$v.avgPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductModel;
  }

  @override
  void update(void Function(ProductModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductModel build() {
    final _$result = _$v ??
        new _$ProductModel._(
            asin: asin,
            title: title,
            html: html,
            image: image,
            star: star,
            ratings: ratings,
            hasSellers: hasSellers,
            hasBuyBox: hasBuyBox,
            bsr: bsr,
            category: category,
            domain: domain,
            updatedAt: updatedAt,
            avgSalesRank: avgSalesRank,
            avgPrice: avgPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
