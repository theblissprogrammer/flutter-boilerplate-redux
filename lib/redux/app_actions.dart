import 'dart:async';

import 'package:flutter/material.dart';
import "package:meta/meta.dart";
import 'package:app/models/product_model.dart';

/// Actions are payloads of information that send data from your application to
/// your store. They are the only source of information for the store.
///
/// They are PODOs (Plain Old Dart Objects).
///


class ConnectToDataSource {
  @override
  String toString() {
    return "ConnectToDataSource{}";
  }
}

class LoadProducts {
  final bool refresh;
  final Set<String> categories;
  final String domain;
  final int minRanking;
  final int maxRanking;
  final int minRating;
  final int maxRating;

  const LoadProducts({
    this.refresh = false,
    this.categories,
    this.domain,
    this.minRanking,
    this.maxRanking,
    this.minRating,
    this.maxRating,
  });

  static LoadProducts SearchNew(LoadProducts loadProducts) {
    return LoadProducts(
      refresh: true,
      categories: loadProducts.categories,
      domain: loadProducts.domain,
      minRating: loadProducts.minRating,
      maxRating: loadProducts.maxRating,
      minRanking: loadProducts.minRanking,
      maxRanking: loadProducts.maxRanking,
    );
  }

  static LoadProducts Retry(LoadProducts loadProducts) {
    return LoadProducts(
      refresh: false,
      categories: loadProducts.categories,
      domain: loadProducts.domain,
      minRating: loadProducts.minRating,
      maxRating: loadProducts.maxRating,
      minRanking: loadProducts.minRanking,
      maxRanking: loadProducts.maxRanking,
    );
  }

  @override
  String toString() {
    return "ConnectToDataSource{}";
  }
}

@immutable
class OnProductsLoaded {
  final List<ProductModel> products;
  final bool refresh;

  const OnProductsLoaded(this.products, {this.refresh});

  @override
  String toString() {
    return "OnProductsLoaded{products: $products}";
  }
}

@immutable
class OnProductsCompleted {

  const OnProductsCompleted();

  @override
  String toString() {
    return "OnProductsCompleted{}";
  }
}

