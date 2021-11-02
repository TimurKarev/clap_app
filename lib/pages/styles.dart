import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle titleText = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: brightTextColor,
  );

  static TextStyle subtitleText = GoogleFonts.quicksand(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: brightTextColor,
  );

  static const brightTextColor = CupertinoColors.white;

  static const blackTextColor = CupertinoColors.black;

  static const primaryColor = Color(0xff41F6CB);

  static const secondaryColor = Color(0xff4D7EF0);

  static const thirdColor = Color(0xffF9F871);
}
