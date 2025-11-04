import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
    // primaryColorDark: Color.fromRGBO(109, 82, 62, 1.0),
    primaryIconTheme: IconThemeData(
      color: Color.fromRGBO(255, 241, 232, 1.0),
    ),
    primaryColor: Color.fromRGBO(255, 241, 232, 1.0),

    primaryColorLight: Color.fromRGBO(255, 241, 232, 1.0),
    textTheme: GoogleFonts.montserratTextTheme().apply(
      bodyColor: Color.fromRGBO(109, 82, 62, 1.0),
      decorationColor: Color.fromRGBO(255, 241, 232, 1.0),
    ),

    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromRGBO(109, 82, 62, 1.0),
    appBarTheme: AppBarThemeData(
      backgroundColor: Color.fromRGBO(109, 82, 62, 1.0),
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(255, 241, 232, 1.0),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(255, 241, 232, 1.0),
    )
);