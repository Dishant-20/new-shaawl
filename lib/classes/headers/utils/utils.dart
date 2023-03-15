// text with regular
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* ================================================================ */

// chat user
Text textWithRegularStyle(str, textSize, textColor, textDirection) {
  return (textDirection == 'left')
      ? Text(
          str.toString(),
          textAlign: TextAlign.left,
          style: GoogleFonts.montserrat(
            fontSize: textSize,
            color: textColor,
          ),
        )
      : Text(
          str.toString(),
          textAlign: TextAlign.right,
          style: GoogleFonts.montserrat(
            fontSize: textSize,
            color: textColor,
          ),
        );
}

Text textWithSemiBoldStyle(str, textSize, textColor) {
  return Text(
    str.toString(),
    style: GoogleFonts.montserrat(
      fontSize: textSize,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
  );
}

/* ================================================================ */
