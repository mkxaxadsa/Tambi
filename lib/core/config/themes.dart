import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: 'SF',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.yellow,
    selectionColor: AppColors.yellow,
    selectionHandleColor: AppColors.yellow,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.grey, // overscroll indicator color
  ),
);
