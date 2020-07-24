import 'package:google_fonts/google_fonts.dart';
import "package:app/utils/hex_color.dart";
import "package:flutter/material.dart";

class AppTheme {
  static const pixelMultiplier = 1.0;
  static const appMargin = 12.0 * pixelMultiplier;
  static const avatarSize = 44.0 * pixelMultiplier;
  static const appBarSize = 64.0;

  static const fontFamilyFutura = "Futura";
  static const fontFamilyFuturaHeavy = "FuturaHeavyFont";
  static const fontFamilyFuturaMedium = "FuturaMedium";
  static const fontFamilyFuturaExtraBold = "FuturaExtraBold";
  static const fontFamilyTTCommons = "TTCommons";


  static const colorDarkBlue = Color.fromRGBO(23, 38, 157, 1.0);
  static const colorDarkBlueFont = Color.fromRGBO(4, 24, 138, 1.0);
  static final colorDarkBlueImageSelection = HexColor("#04188A");
  static const colorDarkGreen = Color.fromRGBO(33, 127, 125, 1.0);
  static const colorLightGreen = Color.fromRGBO(207, 244, 234, 1.0);
  static const colorMintGreen = Color.fromRGBO(54, 207, 166, 1.0);
  static const colorRed = Color.fromRGBO(255, 72, 103, 1.0);
  static const colorShadow = Color.fromRGBO(204, 204, 204, 1.0);
  static const colorTextDisabled = Color.fromRGBO(153, 153, 153, 1.0);
  static const colorTextEnabled = Color.fromRGBO(0, 0, 0, 1.0);
  static const colorTextLink = Color.fromRGBO(74, 144, 226, 1.0);
  static const colorGrey128 = Color.fromRGBO(128, 128, 128, 1.0);
  static const colorGrey128_25 = Color.fromRGBO(128, 128, 128, 0.25);
  static const colorGrey128_50 = Color.fromRGBO(128, 128, 128, 0.5);
  static const colorGrey155 = Color.fromRGBO(155, 155, 155, 1.0);
  static const colorGrey225 = Color.fromRGBO(225, 225, 225, 1.0);
  static const colorGrey241 = Color.fromRGBO(241, 241, 241, 1.0);
  static final colorWhite_50 = Colors.white.withOpacity(0.5);
  static const Color textColor = Color.fromRGBO(44, 46, 63, 1);
  static const Color backgroundColor = Color.fromRGBO(245, 244, 241, 1);
  static const Color stickyHeaderColor = Color.fromRGBO(236, 234, 230, 1);
  static const Color stickyHeaderLetterColor = Color.fromRGBO(161, 160, 156, 1);
  static const Color gold = Color.fromRGBO(255, 201, 25, 1);
  static const Color goldOrange = Color(0xFFF49302);
  static const Color lightGold = Color(0xFFFFC673);
  static const Color darkBlue = Color(0xFF2C2F3F);
  static const Color grey = Color(0xFFA8AAAB);
  static const Color lightGrey = Color(0xFFBFC4CD);
  static const Color dividerColor = Color(0xFFBA9431);
  static const Color inputDividerColor = Color(0xFF979797);
  static const Color hintColor = Color(0xFF95979A);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: goldOrange,
      accentColor: lightGold,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: fontFamilyFutura,
    );
  }

  ///
  ///

  static InputDecoration loginDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      errorMaxLines: 1,
      hintStyle: hintStyle,
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.7),
      ),
    );
  }

  static TextStyle get hintStyle {
    return theme.textTheme.body1.copyWith(
      color: hintColor,
      fontFamily: 'Futura',
    );
  }

  static TextStyle get nfcShareDialog {
    return theme.textTheme.body1.copyWith(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      fontFamily: fontFamilyFuturaHeavy,
    );
  }

  static TextStyle get cardTitle {
    return GoogleFonts.pacifico(
        textStyle: TextStyle(
          fontSize: 36.0,
          color: Colors.white,
        ),
    );
  }
  static TextStyle get notificationTitle {
    return theme.textTheme.body1.copyWith(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      fontFamily: fontFamilyFuturaHeavy,
    );
  }

  static TextStyle get notificationTime {
    return theme.textTheme.body1.copyWith(
      color: Colors.white,
      fontSize: 12,
      fontFamily: fontFamilyFutura,
    );
  }

  static TextStyle get notificationBody {
    return theme.textTheme.body1.copyWith(
      color: Colors.white,
      fontSize: 16,
      fontFamily: fontFamilyFutura,
    );
  }

  static TextStyle get loadingBody {
    return theme.textTheme.body1.copyWith(
      color: Colors.black,
      fontSize: 16,
      fontFamily: fontFamilyFuturaMedium,
    );
  }

  static TextStyle get plusManyPicturesTextStyle {
    return TextStyle(
      fontFamily: fontFamilyFutura,
      fontSize: 32,
    );
  }

  static TextStyle get dialogRsvpYesTextStyle {
    return plusManyPicturesTextStyle.apply(color: AppTheme.colorMintGreen);
  }

  static InputDecorationTheme get inputDecorationEmptyTheme {
    return _inputDecorationTheme(
      baseColor: colorGrey128,
    );
  }

  static InputDecorationTheme get inputDecorationFilledTheme {
    return _inputDecorationTheme(
      baseColor: colorDarkBlueFont,
    );
  }

  static InputDecorationTheme get inputDecorationErrorTheme {
    return _inputDecorationTheme(
      baseColor: colorRed,
    );
  }

  static InputDecorationTheme _inputDecorationTheme({
    baseColor: Color,
    textColor: Color,
  }) {
    return InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide(color: baseColor)),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: baseColor)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: baseColor)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: colorRed)),
      errorStyle: TextStyle(
        fontSize: 12,
        fontFamily: fontFamilyFutura,
        color: colorRed,
      ),
      focusedErrorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: colorRed)),
      labelStyle: TextStyle(
        fontSize: 16,
        fontFamily: fontFamilyFuturaMedium,
        color: baseColor,
      ),
      helperStyle: TextStyle(
        fontSize: 12,
        fontFamily: fontFamilyFutura,
        color: colorGrey128,
      ),
    );
  }
}
