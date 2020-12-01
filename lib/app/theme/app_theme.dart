import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
class AppTheme {
  static ThemeData defaultTheme() => ThemeData.dark().copyWith(
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme));
}
