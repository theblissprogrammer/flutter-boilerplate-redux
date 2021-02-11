import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:app/redux/app_actions.dart';
import 'package:app/redux/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key,}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  LoadProducts action = LoadProducts();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        final store = StoreProvider.of<AppState>(context);
        if (!store.state.productsCompleted) {
          store.dispatch(action);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _emptyList();
  }

  Widget _loading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Loading..."),
          Padding(padding: EdgeInsets.only(bottom: 8.0),),
          CircularProgressIndicator(value: null,)
        ],
      ),
    );
  }

  Widget _emptyList() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("No products match the filters."),
        ],
      ),
    );
  }

  void _resetScrollView() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
