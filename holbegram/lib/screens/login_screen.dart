import 'package:flutter/material.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:holbegram/providers/user_provider.dart';
import 'package:holbegram/screens/home.dart';
import 'package:holbegram/widgets/text_field.dart';
import 'signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;
  BuildContext? _currentContext;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Holbegram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
            ),
            Image.asset(
              '../assets/images/logo.webp',
              width: 80,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  TextFieldInput(
                    isPassword: false,
                    controller: emailController,
                    hintText: "email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFieldInput(
                    controller: passwordController,
                    isPassword: !_passwordVisible,
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      icon: _passwordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(218, 226, 37, 24),
                        ),
                      ),
                      onPressed: () async {
                        String email = emailController.text;
                        String password = passwordController.text;
                        String result = await AuthMethods().login(email: email, password: password);

                        if (result == 'success') {
                          ScaffoldMessenger.of(_currentContext!).showSnackBar(const SnackBar(
                            content: Text('Login successful'),
                          ));
                          userProvider.refreshUser();
                          Navigator.of(_currentContext!).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                        } else {
                          ScaffoldMessenger.of(_currentContext!).showSnackBar(SnackBar(
                            content: Text(result),
                          ));
                        }
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Forgot your login details ? '),
                      Text(
                        'get help logging in ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    flex: 0,
                    child: Container(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupScreen()));
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(218, 226, 37, 24)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Flexible(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 20),
                      ),
                      Flexible(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        '../assets/images/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
                        width: 40,
                        height: 40,
                      ),
                      const Text("Sign in with Google"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUp {}
