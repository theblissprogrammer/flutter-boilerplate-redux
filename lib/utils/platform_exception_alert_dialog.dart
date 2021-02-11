import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super (
    title : title,
    content : _message(exception),
    defaultActionText : 'OK',
  );
  
  static String _message(PlatformException exception){
    print(exception);
    if(exception.message == 'FIRFirestoreErrorDomain'){
      if(exception.code == 'Error 7'){
        return 'Missing or insufficient permissions';
      }
    }
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD': 'The password is weak',
    'ERROR_INVALID_EMAIL': 'The email is invalid',
    'ERROR_EMAIL_ALREADY_IN_USE': 'Email is already in use by a different account',
    'ERROR_WRONG_PASSWORD': 'The password is invalid',
    'ERROR_USER_NOT_FOUND': 'User not found',
    'ERROR_USER_DISABLED': 'User has been disabled',
    'ERROR_TOO_MANY_REQUESTS': 'Too many attempts to sign in',
    'ERROR_OPERATION_NOT_ALLOWED': 'Email and Password account are not enabled',
    'ERROR_INVALID_VERIFICATION_CODE': 'The SMS verification code used is invalid. Please enter a correct SMS code.'
  };
}