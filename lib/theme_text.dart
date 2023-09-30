import 'package:flutter/material.dart';

/*
  displayLarge: dùng để 
*/
// ignore: non_constant_identifier_names
TextTheme TextThemeForDarkMode(TextTheme baseTextTheme) {
  return baseTextTheme.copyWith(
    displayLarge: baseTextTheme.displayLarge!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
    titleLarge: baseTextTheme.titleLarge!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: baseTextTheme.titleMedium!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleSmall: baseTextTheme.titleSmall!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: baseTextTheme.titleSmall!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 17,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

// ignore: non_constant_identifier_names
TextTheme TextThemeForLightMode(TextTheme baseTextTheme) {
  return baseTextTheme.copyWith(
    displayLarge: baseTextTheme.displayLarge!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
    titleLarge: baseTextTheme.titleLarge!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: baseTextTheme.displayMedium!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 17,
      color: Colors.black,
    ),
    titleSmall: baseTextTheme.titleSmall!.copyWith(
      fontFamily: 'BeVietNamPro-Regular',
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
  );
}
