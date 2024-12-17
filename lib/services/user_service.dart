import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserService {
  static const String _usersKey = 'users';

  
  static Future<List<User>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getStringList(_usersKey) ?? [];
    return usersJson
        .map((userStr) => User.fromJson(json.decode(userStr)))
        .toList();
  }

  
  static Future<bool> addUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getStringList(_usersKey) ?? [];

    
    if (usersJson.any(
        (userStr) => User.fromJson(json.decode(userStr)).email == user.email)) {
      return false; // Email already exists
    }

    
    usersJson.add(json.encode(user.toJson()));
    await prefs.setStringList(_usersKey, usersJson);
    return true;
  }

  
  static Future<User?> verifyLogin(String email, String password) async {
    final users = await getUsers();
    try {
      return users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
