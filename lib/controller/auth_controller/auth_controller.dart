import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/const/cont_colors.dart';
import 'package:pos/view/app_views/home_view/home_view.dart';
import '../../model/user_model.dart';
import '../../services/db_service/db_helper.dart';

class AuthController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  void register(String username, String userEmail, String password,
      BuildContext context) async {
    if (userEmail.isEmpty || username.isEmpty || password.isEmpty) {
      Get.snackbar('Fail', 'All fields are required!',
          backgroundColor: kRed.withOpacity(.3));
      return;
    }

    try {
      // Check if the email already exists
      final emailExists = await _databaseHelper.isEmailExists(userEmail);
      if (emailExists) {
        Get.snackbar('Fail', 'Email is already registered!',
            backgroundColor: kRed.withOpacity(.3));
        return;
      }
      // Create the user object
      final user =
          User(username: username, email: userEmail, password: password);
      print('Registering user: ${user.toMap()}'); // Debugging print
      // Proceed with registration
      await _databaseHelper.registerUser(user);
      Get.snackbar('Success', 'User registered successfully!',
          backgroundColor: Colors.green.withOpacity(.3));
      Navigator.pop(context);
    } catch (e) {
      print('Registration error: ${e.toString()}'); // Debugging print
      Get.snackbar('Fail', 'Failed Registration: ${e.toString()}',
          backgroundColor: kRed.withOpacity(.3));
    }
  }

  void login(String email, String password) async {
    print('Attempting to log in with email: $email and password: $password');

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Corrected the condition
        final user = await _databaseHelper.loginUser(email, password);
        if (user != null) {
          final username = user.username.isNotEmpty ? user.username : 'User';
          Get.snackbar('Success', 'Login successful! Welcome, $username!',
              backgroundColor: Colors.green.withOpacity(.3));
          Get.offAll(HomeView());
        } else {
          Get.snackbar('Failed', 'Invalid email or password!',
              backgroundColor: kRed.withOpacity(.3));
        }
      } else {
        Get.snackbar('Failed', 'Email and password cannot be empty!',
            backgroundColor: kRed.withOpacity(.3));
      }
    } catch (e) {
      print('Error during login: ${e.toString()}');
      Get.snackbar('Fail', 'Login Failed ${e.toString()}!',
          backgroundColor: kRed.withOpacity(.3));
    }
  }
}
