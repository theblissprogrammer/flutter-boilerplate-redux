// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final User user;
  @override
  final BuiltList<ProductModel> products;
  @override
  final bool productsCompleted;
  @override
  final String fcmToken;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.user, this.products, this.productsCompleted, this.fcmToken})
      : super._() {
    if (products == null) {
      throw new BuiltValueNullFieldError('AppState', 'products');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        user == other.user &&
        products == other.products &&
        productsCompleted == other.productsCompleted &&
        fcmToken == other.fcmToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, user.hashCode), products.hashCode),
            productsCompleted.hashCode),
        fcmToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('products', products)
          ..add('productsCompleted', productsCompleted)
          ..add('fcmToken', fcmToken))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  ListBuilder<ProductModel> _products;
  ListBuilder<ProductModel> get products =>
      _$this._products ??= new ListBuilder<ProductModel>();
  set products(ListBuilder<ProductModel> products) =>
      _$this._products = products;

  bool _productsCompleted;
  bool get productsCompleted => _$this._productsCompleted;
  set productsCompleted(bool productsCompleted) =>
      _$this._productsCompleted = productsCompleted;

  String _fcmToken;
  String get fcmToken => _$this._fcmToken;
  set fcmToken(String fcmToken) => _$this._fcmToken = fcmToken;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _products = _$v.products?.toBuilder();
      _productsCompleted = _$v.productsCompleted;
      _fcmToken = _$v.fcmToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              user: _user?.build(),
              products: products.build(),
              productsCompleted: productsCompleted,
              fcmToken: fcmToken);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'products';
        products.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
