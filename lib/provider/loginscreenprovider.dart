import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider_state_project/pages/darkthem.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loginUser(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter all fields')));
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"), // <-- Replace with your API
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Login successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Welcome, ${data['user']['name']}!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Darkthem()),
        );
        // Navigate or save token here
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? "Login failed")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}
