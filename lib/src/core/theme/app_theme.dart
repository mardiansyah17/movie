import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/src/core/theme/app_pallete.dart';

class AppTheme {
  static final darkTheme = ThemeData().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: AppPallete.white,
          fontSize: 16,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.poppins(color: AppPallete.white),
      ));
}
