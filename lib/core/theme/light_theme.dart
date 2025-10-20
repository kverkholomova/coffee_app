import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Color.fromRGBO(109, 82, 62, 1.0),),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color.fromRGBO(255, 241, 232, 1.0),
  appBarTheme: AppBarThemeData(
    backgroundColor: Color.fromRGBO(255, 241, 232, 1.0),
    titleTextStyle: GoogleFonts.montserrat(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(109, 82, 62, 1.0),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(109, 82, 62, 1.0),
  )
);