import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  /// textColor: colors.titles,
  /// fontSize: 26
  TextStyle? h1() => Theme.of(this).textTheme.displayLarge;

  /// textColor: colors.paragraphs,
  /// fontSize: 22
  TextStyle? h2() => Theme.of(this).textTheme.displayMedium;

  ///textColor: colors.iconsPlaceholder,
  ///fontSize: 15
  TextStyle? h3() => Theme.of(this).textTheme.displaySmall;

  /// textColor: darkColors.paragraphs,
  /// fontSize: 18
  TextStyle? p1() => Theme.of(this).textTheme.bodyLarge;

  /// textColor: colors.paragraphs,
  /// fontSize: 16
  TextStyle? p2() => Theme.of(this).textTheme.bodyMedium;
}
