import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
  
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  void _login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedEncryptedUsername = prefs.getString('username') ?? '';
    final String savedEncryptedEmail = prefs.getString('email') ?? '';
    final String savedEncryptedPassword = prefs.getString('password') ?? '';
    final String savedKey = prefs.getString('key') ?? '';
    final String savedIV = prefs.getString('iv') ?? '';
    final String enteredEmail = _emailController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText = 'Email and password must be filled';
      });
      return;
    }

    if (savedEncryptedEmail.isEmpty ||
        savedEncryptedPassword.isEmpty ||
        savedKey.isEmpty ||
        savedIV.isEmpty) {
      setState(() {
        _errorText = 'No account found.';
      });
      return;
    }

    final encrypt.Key key = encrypt.Key.fromBase64(savedKey);
    final encrypt.IV iv = encrypt.IV.fromBase64(savedIV);
    final decrypter = encrypt.Encrypter(encrypt.AES(key));

    final decryptedUsername = decrypter.decrypt64(
      savedEncryptedUsername,
      iv: iv,
    );
    final decryptedEmail = decrypter.decrypt64(savedEncryptedEmail, iv: iv);
    final decryptedPassword = decrypter.decrypt64(
      savedEncryptedPassword,
      iv: iv,
    );

    if (enteredEmail == decryptedEmail &&
        enteredPassword == decryptedPassword) {
      await prefs.setBool('isSignedIn', true);
      setState(() {
        _errorText = '';
        _isSignedIn = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      setState(() {
        _errorText = 'Email or password is incorrect';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/console.png', height: 100),
                ShaderMask(
                  shaderCallback: (bounds) =>
                      const LinearGradient(
                        colors: [
                          Color(0xFF3A3FF2),
                          Color(0xFF7754F4),
                          Color(0xFF965FF5),
                        ],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: Text(
                    "GamePedia",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Quicksand',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF190D84), Color(0xFF20143D)],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand',
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand',
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          errorText: _errorText.isNotEmpty ? _errorText : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
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
                      // Elevated Button Login
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1124A5), Color(0xFF6F30DC)],
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register here',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontFamily: 'Quicksand',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/register');
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Join millions of gamers worldwide!',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
