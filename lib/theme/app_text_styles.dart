import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;

  TextStyle get titleAppBar;

  TextStyle get button;

  TextStyle get heading40;

  TextStyle get heading60;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
        color: AppTheme.colors.button,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get title => GoogleFonts.montserrat(
        color: AppTheme.colors.title,
        fontSize: 40,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get titleAppBar => GoogleFonts.montserrat(
        color: AppTheme.colors.backgroundPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get heading40 => GoogleFonts.inter(
        color: AppTheme.colors.titleHeading40,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get heading60 => GoogleFonts.inter(
        color: AppTheme.colors.title,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
}
