import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_project/provider/loginscreenprovider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Login")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: provider.emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: provider.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 24),
                provider.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => provider.loginUser(context),
                        child: const Text('Login'),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
