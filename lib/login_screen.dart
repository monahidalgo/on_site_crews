import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/bkg.png',
            fit: BoxFit.cover, // Add this line
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Image.asset('assets/images/onsitelogin.jpeg'), // Logo image
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(labelText: 'Username'),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            // Validate and navigate to dashboard
                            if (_usernameController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              Navigator.pushNamed(context, '/dashboard');
                            }
                          },
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot_password');
                          },
                          child: const Text("Forgot Password?"),
                        ),
                        const SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/create_account');
                          },
                          child: const Text("Don't have an account? Create Account"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}