import 'package:flutter/material.dart';

class Navigation {
  static Future<T> toScreen<T>({BuildContext context, NavigatorState state, Widget screen}) async {
    if (state == null) {
      return await Navigator.push<T>(
          context,
          MaterialPageRoute(builder: (BuildContext context) => screen)
      );
    } else {
      return state.push<T>(
          MaterialPageRoute(builder: (BuildContext context) => screen)
      );
    }
  }

  static Future<T> toScreenRemoveUntil<T>({
    BuildContext context,
    dynamic screen,
  }) async {
    return await Navigator.pushAndRemoveUntil<T>(
      context,
      MaterialPageRoute(builder: (BuildContext context) => screen),
          (_) => false,
    );
  }

  static void pop<T>(BuildContext context, {T result}) {
    if (result == null) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).pop<T>(result);
  }
}