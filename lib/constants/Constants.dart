import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Constants {
  // Title
  static final String appTitle = "MORTEXT";

  // Fonts
  static final TextStyle titleFont = GoogleFonts.handjet(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Colors.red.shade900,
    letterSpacing: 1.5,
  );

  static final TextStyle textFont = GoogleFonts.aubrey(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: Colors.white54,
  );

  static final TextStyle buttonFont = GoogleFonts.vt323(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final TextStyle titleTextFont = GoogleFonts.delius(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: Colors.white54,
  );

  // Colors
  static final Color primaryColor = Colors.black38;
  static final Color secondaryColor = Colors.black26;
}
