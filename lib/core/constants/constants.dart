import 'package:flutter/material.dart';

const colorBlue = Color.fromRGBO(8, 102, 255, 1.0);
final colorSplash = Colors.grey.withAlpha((0.2 * 255).round());
const colorBlack = Color.fromRGBO(161, 149, 161, 1);
const colorGrey = Color.fromRGBO(141, 141, 141, 1.0);
const colorPurple = Color.fromRGBO(146, 106, 255, 1.0);
const colorDarkBlue = Color.fromRGBO(20, 25, 45, 1.0);
const colorWhite = Colors.white;

const TextTheme textThemeDefault = TextTheme(
  displayLarge: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 26,
  ),
  displayMedium: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 22,
  ),
  displaySmall: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  ),
  headlineMedium: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  ),
  headlineSmall: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  titleLarge: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  ),
  bodyLarge: TextStyle(
    color: colorBlack,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
  ),
  bodyMedium: TextStyle(
    color: colorGrey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
  ),
  titleMedium: TextStyle(
    color: colorBlack,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  titleSmall: TextStyle(
    color: colorGrey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
);

const TextTheme textThemeSmall = TextTheme(
  displayLarge: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 22,
  ),
  displayMedium: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  ),
  displaySmall: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  ),
  headlineMedium: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  headlineSmall: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  ),
  titleLarge: TextStyle(
    color: colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 10,
  ),
  bodyLarge: TextStyle(
    color: colorBlack,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.5,
  ),
  bodyMedium: TextStyle(
    color: colorGrey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.5,
  ),
  titleMedium: TextStyle(
    color: colorBlack,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  ),
  titleSmall: TextStyle(
    color: colorGrey,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  ),
);
