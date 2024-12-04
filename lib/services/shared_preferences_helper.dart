import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPreferencesHelper {
  static const String _isLoggedInKey = "isLoggedIn";

  /// Save login status
  static Future<void> saveLoginStatus(bool isLoggedIn) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, isLoggedIn);
    } catch (e) {
      debugPrint("Error saving login status: $e");
    }
  }

  /// Logout the user and navigate to the login page
  static Future<void> logout(BuildContext context) async {
    try {
      await clearLoginStatus();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      debugPrint("Error during logout: $e");
    }
  }

  /// Get the login status
  static Future<bool> getLoginStatus() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isLoggedInKey) ?? false;
    } catch (e) {
      debugPrint("Error getting login status: $e");
      return false;
    }
  }

  /// Clear login status
  static Future<void> clearLoginStatus() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(_isLoggedInKey);
    } catch (e) {
      debugPrint("Error clearing login status: $e");
    }
  }
}