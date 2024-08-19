import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../../services/db_service/db_helper.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  void register(BuildContext context) async {
    final usereamil = userEmailController.text.trim();
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      final user =
          User(username: username, password: password, email: usereamil);
      await _databaseHelper.registerUser(user);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User registered successfully!')),
      );
    }
  }

  void login(BuildContext context) async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final email = userEmailController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      final user = await _databaseHelper.loginUser(email, password);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Login successful! Welcome, ${user.username}!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password!')),
        );
      }
    }
  }
}
