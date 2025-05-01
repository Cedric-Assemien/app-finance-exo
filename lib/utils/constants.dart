import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF000000);
  static const Color accentColor = Color(0xFFFFD700); // Couleur jaune du logo QR
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Colors.white;
  static const Color textDarkColor = Color(0xFF000000);
  static const Color textLightColor = Color(0xFF757575);
  static const Color greenColor = Color(0xFF4CAF50);
  static const Color redColor = Color(0xFFE53935);
  
  // Couleurs pour les graphiques
  static const Color chartOrangeColor = Color(0xFFFF9800);
  static const Color chartGreenColor = Color(0xFF4CAF50);
}

class AppStyles {
  static TextStyle headingLarge = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textDarkColor,
  );
  
  static TextStyle headingMedium = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDarkColor,
  );
  
  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textDarkColor,
  );
  
  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textDarkColor,
  );
  
  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textLightColor,
  );
  
  static TextStyle balanceStyle = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textDarkColor,
  );
}