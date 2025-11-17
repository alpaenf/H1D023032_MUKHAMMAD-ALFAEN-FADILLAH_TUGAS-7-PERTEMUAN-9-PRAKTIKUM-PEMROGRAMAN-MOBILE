import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _usernameKey = 'username';

  // Singleton pattern
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  SharedPreferences? _prefs;

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Save login status
  Future<void> saveLoginStatus(bool isLoggedIn) async {
    await init();
    await _prefs?.setBool(_isLoggedInKey, isLoggedIn);
  }

  // Get login status
  Future<bool> isLoggedIn() async {
    await init();
    return _prefs?.getBool(_isLoggedInKey) ?? false;
  }

  // Save username
  Future<void> saveUsername(String username) async {
    await init();
    await _prefs?.setString(_usernameKey, username);
  }

  // Get username
  Future<String?> getUsername() async {
    await init();
    return _prefs?.getString(_usernameKey);
  }

  // Clear all data (logout)
  Future<void> clearAll() async {
    await init();
    await _prefs?.clear();
  }

  // Logout
  Future<void> logout() async {
    await saveLoginStatus(false);
    await _prefs?.remove(_usernameKey);
  }
}
