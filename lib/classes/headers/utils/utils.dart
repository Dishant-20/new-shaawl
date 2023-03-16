// text with regular
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

/* ================================================================ */

// chat user
Text textWithRegularStyle(str, textSize, textColor, textDirection) {
  return (textDirection == 'left')
      ? Text(
          str.toString(),
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: textSize,
            color: textColor,
          ),
        )
      : Text(
          str.toString(),
          textAlign: TextAlign.right,
          style: GoogleFonts.poppins(
            fontSize: textSize,
            color: textColor,
          ),
        );
}

Text textWithSemiBoldStyle(str, textSize, textColor) {
  return Text(
    str.toString(),
    style: GoogleFonts.poppins(
      fontSize: textSize,
      fontWeight: FontWeight.w700,
      color: textColor,
    ),
  );
}

/* ================================================================ */
/* ================================================================ */

/* ========== CONVERT TIMESTAMP TO DATE AND TIME =============== */

funcConvertTimeStampToDateAndTime(getTimeStamp) {
  var dt = DateTime.fromMillisecondsSinceEpoch(getTimeStamp);
  // var d12HourFormat = DateFormat('dd/MM/yyyy, hh:mm').format(dt);
  var d12HourFormatTime = DateFormat('hh:mm a').format(dt);
  return d12HourFormatTime;
}

/* ================================================================ */
/* ================================================================ */
