import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.gray200,
    primaryColor: AppColors.emerald600,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.emerald600,
      foregroundColor: AppColors.gray900,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
      titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white, fontSize: 20),
      headlineLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}
