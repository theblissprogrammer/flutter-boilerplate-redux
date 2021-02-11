class FirestorePaths {
  static const PATH_PRODUCTS = "products";
  static const PATH_USERS = "users";

  static String userPath(String userId) {
    return "$PATH_USERS/$userId";
  }

  static String productPath(String asin) {
    return "$PATH_PRODUCTS/$asin";
  }
}
