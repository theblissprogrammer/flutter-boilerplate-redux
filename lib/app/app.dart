import 'package:app/app/screens/home/home_screen.dart';
import 'package:app/app/screens/login/email_login_screen.dart';
import 'package:app/data/data_repository.dart';
import 'package:app/data/user_repository.dart';
import 'package:app/redux/app_middleware.dart';
import 'package:app/redux/app_reducer.dart';
import 'package:app/redux/app_state.dart';
import 'package:app/redux/authentication/auth_actions.dart';
import 'package:app/redux/authentication/auth_middleware.dart';
import 'package:app/redux/push/push_middleware.dart';
import 'package:app/redux/user/user_actions.dart';
import 'package:app/redux/user/user_middleware.dart';
import 'package:app/utils/localization.dart';
import 'package:app/utils/store_util.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'routes.dart';


class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Store<AppState> store;
  static final _navigatorKey = GlobalKey<NavigatorState>();
  final userRepo = UserRepository();
  final dataRepository = DataRepository();

  @override
  void initState() {
    super.initState();

    store = Store<AppState>(
      appReducer,
      initialState: StoreUtils.initialState,
      middleware: createStoreMiddleware(
        dataRepository,
        _navigatorKey,
      )
        ..add(StoreUtils.persistor.createMiddleware())
        ..addAll(createAuthenticationMiddleware(
          userRepo,
          _navigatorKey,
        ))
        ..addAll(createUserMiddleware(userRepo, _navigatorKey,))
        ..addAll(createPushMiddleware(
          userRepo,
        )),
    );

    // Save global access to store
    StoreUtils.store = store;

    store.dispatch(VerifyAuthenticationState());

  }

  // Used to propagate this users current locale to our backend (which then can send localized notifications).
  _updateUserLocale(context) {
    final localeCode = AppLocalizations.of(context).locale.languageCode;
    StoreProvider.of<AppState>(context)
        .dispatch(UpdateUserLocaleAction(localeCode));
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      supportedLocales: [
        const Locale("en", "US"),
      ],
      title: "Nour Music",
      navigatorKey: _navigatorKey,
      theme: AppTheme.theme,
      home: EmailLoginScreen(),
      routes: {
        Routes.login: (context) {
          return EmailLoginScreen();
        },
        Routes.home: (context) {
          // We need a context and a user. Both are present when loading MainScreen.
          _updateUserLocale(context);
          return HomeScreen();
        },
      },
    );
  }
}