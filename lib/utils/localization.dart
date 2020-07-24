import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";

import "cupertino_localization_delegate.dart";

final localizationsDelegates = <LocalizationsDelegate>[
  const AppLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  const FallbackCupertinoLocalisationsDelegate()
];

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
        context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "log_out": "Logout",
      "generic_soon_alert_title": "We are working on it",
      "generic_soon_alert_message": "This functionality will be available soon.",
      "generic_yes": "Yes",
      "generic_cancel": "Cancel",
      "generic_next": "Next",
      "generic_ok": "OK",
      "generic_back": "Back",
      "generic_at": "at",
      "generic_you": "You",
      "generic_save": "Save",
      "generic_edit": "Edit",
      "generic_delete": "Delete",
    }
  };

  /// This method returns the localized value of the passed id
  /// it defaults to english if the locale is missing
  String _localizedValue(String id) =>
      _localizedValues[locale.languageCode][id] ?? _localizedValues["en"][id];

  // Generic
  String get genericSoonAlertTitle {
    return _localizedValue("generic_soon_alert_title");
  }

  String get genericSoonAlertMessage {
    return _localizedValue("generic_soon_alert_message");
  }

  String get yes {
    return _localizedValue("generic_yes");
  }

  String get cancel {
    return _localizedValue("generic_cancel");
  }

  String get next {
    return _localizedValue("generic_next");
  }

  String get ok {
    return _localizedValue("generic_ok");
  }

  String get back {
    return _localizedValue("generic_back");
  }

  String get at => _localizedValue("generic_at");

  String get you => _localizedValue("generic_you");

  String get save => _localizedValue("generic_save");

  String get edit => _localizedValue("generic_edit");

  String get delete => _localizedValue("generic_delete");

  String authErrorMessage(String code) {
    switch (code) {
      case "ERROR_USER_NOT_FOUND":
        return _localizedValue("login_fail_user_not_found");
      default:
        return _localizedValue("login_fail").replaceAll("{code}", code);
    }
  }

  /// Platform 
  String get platformAlertAccessTitle => _localizedValue("platform_alert_access_title");
  String get platformAlertAccessResourceCamera => _localizedValue("platform_alert_access_resource_camera");
  String get platformAlertAccessResourcePhotos => _localizedValue("platform_alert_access_resource_photos");
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["en"].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
        AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
