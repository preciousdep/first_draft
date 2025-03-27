import 'package:first_draft/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void login(User user) {
    _currentUser = user;
    notifyListeners(); // Notify UI about the change
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
