import 'package:flutter/material.dart';

// Define your base color
const Color primaryColorValue = Color(0xFF1E88E5); // Example primary color

// Create a MaterialColor from your base color
Map<int, Color> colorShades = {
  50: primaryColorValue.withOpacity(0.1),
  100: primaryColorValue.withOpacity(0.2),
  200: primaryColorValue.withOpacity(0.3),
  300: primaryColorValue.withOpacity(0.4),
  400: primaryColorValue.withOpacity(0.5),
  500: primaryColorValue.withOpacity(0.6),
  600: primaryColorValue.withOpacity(0.7),
  700: primaryColorValue.withOpacity(0.8),
  800: primaryColorValue.withOpacity(0.9),
  900: primaryColorValue,
};

MaterialColor primaryColor = MaterialColor(primaryColorValue.value, colorShades);
const Color secondaryColor = Color(0xFF8E24AA);
const Color accentColor = Color(0xFF00C853);
const Color profileColor = Color(0xFF039BE5);

