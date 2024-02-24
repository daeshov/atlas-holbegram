// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;

  const SignUpScreen({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
  });

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Similar structure as the LoginScreen
            // Implement your UI elements based on the provided instructions
            // ...

            // TextButton for navigation to the Login page
            TextButton(
              onPressed: () {
                // Implement navigation to the Login page
                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Text('Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
