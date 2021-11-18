import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.purple,
  splashColor: Colors.purpleAccent,
  highlightColor: Colors.purple,
  textTheme: GoogleFonts.latoTextTheme()
);

class Themes {
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}