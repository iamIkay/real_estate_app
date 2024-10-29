import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/config/theme/palette.dart';

class AppTheme {
  final _theme = ThemeData(
    primaryColor: Palette.primary,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Palette.offwhite,
  );

  ThemeData get theme => _theme;
}
