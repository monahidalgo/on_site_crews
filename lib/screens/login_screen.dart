import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo at the top, with padding and adjusted size
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset(
                'assets/images/sitelogo.png',
                width: 280,  // Adjust size to make it larger
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            // Login form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Colors.white70, // Slightly transparent background
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white70, // Slightly transparent background
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_usernameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          Navigator.pushNamed(context, '/projects');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.orange,
                      ),
                      child: const Text("Forgot Password?"),
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/create_account');
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
