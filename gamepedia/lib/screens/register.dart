import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool isSignedIn = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),

                  // TODO: 7. Pasang Elevated Button Sign In
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () {}, child: Text('Register')),

                  // // TODO; 8. Pasang TextButton Sign Up
                  SizedBox(height: 10),
                  // TextButton(onPressed: (){}, child: Text('Belum punya akun? Daftar di sini.'))
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Sudah ada akun ',
                  //     style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: 'Sign in di sini.',
                  //         style: TextStyle(
                  //           color: Colors.blue,
                  //           decoration: TextDecoration.underline,
                  //           fontSize: 16,
                  //         ),
                  //         recognizer: TapGestureRecognizer()..onTap = () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
