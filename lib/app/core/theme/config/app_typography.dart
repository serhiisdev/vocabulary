import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  static final titleLarge = GoogleFonts.noticiaText(
    textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
  );
  static final titleLargeBold = GoogleFonts.noticiaText(
    textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
  );
  static final titleMedium = GoogleFonts.noticiaText(
    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
  );
  static final titleSmall = GoogleFonts.noticiaText(
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  );

  static final bodyLargeBold = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
  static final bodyMedium = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );
  static final labelLargeBold = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
  );
  static final labelSmall = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
  );
}
