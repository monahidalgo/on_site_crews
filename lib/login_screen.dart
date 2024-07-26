import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            padding: EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: Image.asset('assets/images/onsitelogin.jpeg'), // Logo image
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Username'),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            // Validate and navigate to dashboard
                            if (_usernameController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              Navigator.pushNamed(context, '/dashboard');
                            }
                          },
                          child: Text('Login'),
                        ),
                        SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot_password');
                          },
                          child: Text("Forgot Password?"),
                        ),
                        SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/create_account');
                          },
                          child: Text("Don't have an account? Create Account"),
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