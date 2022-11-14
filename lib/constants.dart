import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kLoginTitleStyle(Size size) => TextStyle(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
      color: Color(0xff1851D1),
      fontFamily: 'cairo',
    );

TextStyle kLoginSubtitleStyle(Size size) => TextStyle(
      fontSize: size.height * 0.030,
      fontFamily: 'mont',
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) => TextStyle(
      fontSize: 15,
      color: Colors.grey,
      height: 1.5,
      fontFamily: 'mont',
    );

TextStyle kHaveAnAccountStyle(Size size) => TextStyle(
      fontSize: size.height * 0.022,
      color: Colors.black,
      fontFamily: 'mont',
    );

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    TextStyle(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Color(0xff1851D1),
      fontFamily: 'mont',
    );

TextStyle kTextFormFieldStyle() => const TextStyle(
      color: Colors.black,
      fontFamily: 'mont',
    );
