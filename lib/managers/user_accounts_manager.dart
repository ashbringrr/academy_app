import '../models/user_model.dart';

class UserAccountsManager {
  static final UserAccountsManager _instance = UserAccountsManager._internal();
  factory UserAccountsManager() => _instance;

  final List<User> _users = [];

  UserAccountsManager._internal();

  void addUser(User user) {
    _users.add(user);
  }

  List<User> get users => List.unmodifiable(_users);
}
