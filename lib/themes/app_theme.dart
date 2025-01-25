import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppThemes {
  static const String urbanistFontFamily = 'Urbanist';

  // Light Theme
  static final lightTheme = FlexThemeData.light(
    scheme: FlexScheme.blue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendTextTheme: true,
      useTextTheme: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.w900), // Black
      displayMedium: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w800), // ExtraBold
      displaySmall: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.bold), // Bold
      headlineMedium: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w600), // SemiBold
      titleLarge: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w500), // Medium
      bodyLarge: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.normal), // Regular
      bodyMedium: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 14), // Light
      bodySmall: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.w300), // Light
      labelSmall: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w200), // ExtraLight
      labelLarge: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 18), // ExtraLight
      headlineSmall: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.w800),
      titleMedium: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.w600),
      titleSmall: const TextStyle(fontFamily: urbanistFontFamily),
    ),
  );

  // Dark Theme
  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.blue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendTextTheme: true,
      useTextTheme: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.w900), // Black
      displayMedium: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w800), // ExtraBold
      displaySmall: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.bold), // Bold
      headlineMedium: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w600), // SemiBold
      titleLarge: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w500), // Medium
      bodyLarge: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.normal), // Regular
      bodyMedium: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.w300), // Light
      labelSmall: const TextStyle(
          fontFamily: urbanistFontFamily,
          fontWeight: FontWeight.w200), // ExtraLight
      headlineSmall: const TextStyle(
          fontFamily: urbanistFontFamily, fontWeight: FontWeight.w800),
    ),
  );
}
