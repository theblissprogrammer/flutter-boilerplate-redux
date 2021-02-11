import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  static void showOkDialog(BuildContext context, String title, String content) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              content,
              style: TextStyle(color: Colors.grey[800]),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  static showAlertDialog({
    BuildContext context,
    String title,
    Color titleColor,
    String content,
    String submitText = 'OK',
    VoidCallback onSubmit,
  }) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(title),
            ),
            content: Text(content),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                isDefaultAction: true,
                child: Text('Cancel'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  onSubmit();
                },
                child: Text(submitText),
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              content,
              style: TextStyle(color: Colors.grey[800]),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Cancel'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text(
                  submitText.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  onSubmit();
                },
              ),
            ],
          );
        },
      );
    }
  }

  static showFeedback({
    BuildContext context,
    Function(String) onClick,
  }) {
    showCupertinoModalPopup(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          message: Column(
            children: <Widget>[
              CupertinoActionSheetAction(
                onPressed: () => onClick("[Feedback] Tell us what you love"),
                child: Text('Tell us what you love'),
              ),
              CupertinoActionSheetAction(
                onPressed: () => onClick("[Feedback] Tell us what you dislike"),
                child: Text('Tell us what you dislike'),
              ),
              CupertinoActionSheetAction(
                onPressed: () => onClick("[Bug] Bug Report"),
                child: Text('Report a bug'),
              ),
              CupertinoActionSheetAction(
                onPressed: () => onClick("[Help] Help Needed"),
                child: Text('Request help'),
              ),
            ],
          ),
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }

  static saveContact({
    BuildContext context,
    VoidCallback onSaveContact,
    VoidCallback onSaveCard,
    VoidCallback onNotSave,
  }) {
    showCupertinoModalPopup(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: onSaveCard,
              child: Text('Save as Contact'),
            ),
            CupertinoActionSheetAction(
              onPressed: onSaveCard,
              child: Text('Save as Card'),
            ),
            CupertinoActionSheetAction(
              onPressed: onNotSave,
              child: Text('Do Not Save', style: TextStyle(color: Colors.red)),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }
}
