import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/screens/RegisterScreen.dart';
import 'package:sports_app/screens/sports_category.dart';
import 'package:sports_app/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _phoneNumberController = TextEditingController();
  final _otpController = TextEditingController();
  String? _generatedOtp;
  bool _isLoading = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeats animation and reverses

    // Define the animation for scaling the image
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: child,
                    );
                  },
                  child: SizedBox(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/icons/balls-sports.png'),
                  ),
                ),
                // AnimatedBuilder(
                //   animation: _animation,
                //   builder: (context, child) {
                //     return Transform.scale(
                //       scale: _animation.value,
                //       child: child,
                //     );
                //   },
                //   child: SizedBox(
                //     //height: 180,
                //     //width: 180,
                //     child: Text(
                //       'Login',
                //       style: TextStyle(
                //         color: secondaryColor,
                //         fontSize: 30,
                //         fontFamily: 'Ubuntu',
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 30,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: TextField(
                    style: const TextStyle(color: secondaryColor),
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                        ),
                        prefixIconColor: secondaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: thirdColor),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: secondaryColor)),
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.dark,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  style: const TextStyle(color: secondaryColor),
                  controller: _otpController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: thirdColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      labelText: 'OTP',
                      labelStyle: TextStyle(color: secondaryColor)),
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.dark,
                ),
                const SizedBox(height: 30),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: thirdColor, // Background color
                          foregroundColor:
                              secondaryColor, // Foreground (text) color
                        ),
                        onPressed: _verifyOtp,
                        child: const SizedBox(
                          width: 100,
                          child: Center(
                            child: Text(
                              'Verify OTP',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: thirdColor, // Background color
                    foregroundColor: secondaryColor, // Foreground (text) color
                  ),
                  onPressed: _generateOtp,
                  child: const SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        'Generate OTP',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: thirdColor, // Background color
                    foregroundColor: secondaryColor, // Foreground (text) color
                  ),
                  onPressed: _googleLogin,
                  child: const SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Login with Google',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    const Text(
                      'Don\'t have an account ?',
                      style: TextStyle(color: secondaryColor, fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Registerscreen(),
                          ));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: thirdColor, fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _generateOtp() {
    final random = Random();
    _generatedOtp = (random.nextInt(9000) + 1000).toString();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: primaryColor,
        title: const Text(
          'Your OTP',
          style: TextStyle(color: secondaryColor, fontSize: 25),
        ),
        content: Text(
          '$_generatedOtp',
          style: const TextStyle(color: secondaryColor, fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(color: secondaryColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  void _verifyOtp() async {
    if (_otpController.text == _generatedOtp) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        _isLoading = false;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      prefs.setString('loginType', 'phone');
      prefs.setString('phoneNumber', _phoneNumberController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CategoryScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          title: const Row(
            children: [
              Text(
                'Error',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.error,
                color: Colors.red,
              ),
            ],
          ),
          content: const Text(
            'Invalid OTP',
            style:  TextStyle(color: secondaryColor, fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'OK',
                style: TextStyle(color: secondaryColor, fontSize: 20),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      var result = await googleSignIn.signIn();
      if (result != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        prefs.setString('loginType', 'google');
        prefs.setString('firstName', result.displayName?.split(' ')[0] ?? '');
        prefs.setString('lastName', result.displayName?.split(' ')[1] ?? '');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoryScreen(),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
  }
}
