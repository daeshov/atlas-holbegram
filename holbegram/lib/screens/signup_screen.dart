import 'package:flutter/material.dart';
import 'package:holbegram/screens/auth/upload_image_screen.dart';
import '../widgets/text_field.dart';
import 'login_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isPasswordVisible = true;
  final bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    setState(() {
    });
  }
  // Transfert the data to the next screen
  void toUploadImageScreen({
    required String email,
    required String password,
    required String username,
  }) {
    if (_usernameController.text.isEmpty) {
      showSnackBar(context, 'Please enter your username');
    } else if (_emailController.text.isEmpty) {
      showSnackBar(context, 'Please enter your email');
    } else if (_passwordController.text.isEmpty) {
      showSnackBar(context, 'Please enter your password');
    } else if (_passwordConfirmController.text.isEmpty) {
      showSnackBar(context, 'Please confirm your password');
    } else if (_passwordController.text != _passwordConfirmController.text) {
      showSnackBar(context, 'Passwords do not match');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddPicture(
            email: _emailController.text,
            password: _passwordController.text,
            username: _usernameController.text,
          ),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Holbegram',
                      style: TextStyle(
                        fontFamily: 'Billabong',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image(
                      image: AssetImage('../assets/images/logo.webp'),
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
              Text(
                'Sign up to see photos and videos from your friends.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                controller: _emailController,
                hintText: 'Enter Your Email',
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
              ),
              const SizedBox(height: 24),

              // Text field for email
              TextFieldInput(
                controller: _usernameController,
                hintText: 'Full Name',
                keyboardType: TextInputType.text,
                isPassword: false,
              ),
              const SizedBox(height: 24),
              // Text field for password
              TextFieldInput(
                controller: _passwordController,
                hintText: 'Enter Your Password',
                keyboardType: TextInputType.text,
                isPassword: _isPasswordVisible,
                suffixIcon: IconButton(
                  color: _isPasswordVisible
                      ? Colors.black12
                      : const Color.fromARGB(218, 226, 37, 24),
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                controller: _passwordConfirmController,
                hintText: 'Confirm your Password',
                keyboardType: TextInputType.text,
                suffixIcon: IconButton(
                  color: _isPasswordVisible
                      ? Colors.black12
                      : const Color.fromARGB(218, 226, 37, 24),
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: togglePasswordVisibility,
                ),
                isPassword: _isPasswordVisible,
              ),

              const SizedBox(height: 24),
              InkWell(
                onTap: () => toUploadImageScreen(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                ),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: Color.fromARGB(218, 226, 37, 24),
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightBlueAccent,
                          ),
                        )
                      : const Text('Sign up'),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: const Text('Have an account?'),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(218, 226, 37, 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
    
  void showSnackBar(BuildContext context, String message) {ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  
}