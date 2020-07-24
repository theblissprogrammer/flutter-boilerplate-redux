import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:app/redux/app_state.dart';
import 'package:app/redux/authentication/auth_actions.dart';
import 'package:app/utils/localization.dart';
import 'package:app/utils/logger.dart';

class EmailLoginScreen extends StatefulWidget {

  const EmailLoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() {
    if (_formKey.currentState.validate()) {
      final loginAction = EmailLogIn(
        email: emailController.text.trim(),
        password: passwordController.text,
        context: context,
      );

      StoreProvider.of<AppState>(context).dispatch(loginAction);

      loginAction.completer.future.catchError((error) {
        Logger.w(error.code.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      body: Center(
        child: Form(
            key: _formKey,
            child: Container(
              constraints: BoxConstraints(minWidth: 200, maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                        "Zaezy",
                        style: AppTheme.cardTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 48.0,
                      bottom: 22.0,
                    ),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: _emailFocus,
                        onFieldSubmitted: (term){
                          _fieldFocusChange(context, _emailFocus, _passwordFocus);
                        },
                        controller: emailController,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Futura',
                        ),
                        cursorColor: AppTheme.darkBlue,
                        decoration: AppTheme.loginDecoration("email"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 22.0,
                    ),
                    child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        focusNode: _passwordFocus,
                        onFieldSubmitted: (value){
                          _passwordFocus.unfocus();
                          _login();
                        },
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Futura',
                        ),
                        cursorColor: AppTheme.darkBlue,
                        decoration: AppTheme.loginDecoration("password"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        }
                    ),
                  ),
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: () => _login(),
                    color: AppTheme.colorMintGreen,
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
