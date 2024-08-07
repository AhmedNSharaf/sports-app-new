// import 'dart:ffi';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sports_app/generated/l10n.dart';
// import 'package:sports_app/screens/RegisterScreen.dart';
// import 'package:sports_app/screens/CategoryScreen.dart';
// import 'package:sports_app/utils/colors.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final _phoneNumberController = TextEditingController();
//   final _otpController = TextEditingController();
//   String? _generatedOtp;
//   bool _isLoading = false;
//   bool _isLogin = true;

//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize AnimationController
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true); // Repeats animation and reverses

//     // Define the animation for scaling the image
//     _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 70,
//                 ),
//                 AnimatedBuilder(
//                   animation: _animation,
//                   builder: (context, child) {
//                     return Transform.scale(
//                       scale: _animation.value,
//                       child: child,
//                     );
//                   },
//                   child: SizedBox(
//                     height: 180,
//                     width: 180,
//                     child: Image.asset('assets/icons/balls-sports.png'),
//                   ),
//                 ),
//                 SizedBox(
//                   child: Text(
//                     S.of(context).Login,
//                     style: TextStyle(
//                       color: secondaryColor,
//                       fontSize: 30,
//                       fontFamily: 'Ubuntu',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Form(
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         style: const TextStyle(color: secondaryColor),
//                         controller: _phoneNumberController,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(
//                               Icons.phone,
//                             ),
//                             prefixIconColor: secondaryColor,
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: thirdColor),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: secondaryColor,
//                               ),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(25.0)),
//                             ),
//                             labelText: S.of(context).phoneNumber,
//                             labelStyle: TextStyle(color: secondaryColor)),
//                         keyboardType: TextInputType.number,
//                         keyboardAppearance: Brightness.dark,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       TextField(
//                         style: const TextStyle(color: secondaryColor),
//                         controller: _otpController,
//                         decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: thirdColor),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: secondaryColor),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(25.0)),
//                             ),
//                             labelText: S.of(context).OTP,
//                             labelStyle: TextStyle(color: secondaryColor)),
//                         keyboardType: TextInputType.number,
//                         keyboardAppearance: Brightness.dark,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: thirdColor,
//                       foregroundColor: secondaryColor),
//                   onPressed: () {
//                     setState(() {
//                       _isLogin = !_isLogin;
//                     });
//                   },
//                   child: Text(
//                     _isLogin ? 'login' : 'signUp',
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     _isLogin
//                         ? 'Create an account ?'
//                         : 'I already have an account ',
//                     style: TextStyle(color: thirdColor),
//                   ),
//                 ),
//                 // _isLoading
//                 //     ? const CircularProgressIndicator()
//                 //     : ElevatedButton(
//                 //         style: ElevatedButton.styleFrom(
//                 //           backgroundColor: thirdColor, // Background color
//                 //           foregroundColor:
//                 //               secondaryColor, // Foreground (text) color
//                 //         ),
//                 //         onPressed: _verifyOtp,
//                 //         child: SizedBox(
//                 //           width: 200,
//                 //           child: Center(
//                 //             child: Text(
//                 //               S.of(context).VerifyOTP,
//                 //               style: TextStyle(fontSize: 20),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 // const SizedBox(height: 16),
//                 // ElevatedButton(
//                 //   style: ElevatedButton.styleFrom(
//                 //     backgroundColor: thirdColor, // Background color
//                 //     foregroundColor: secondaryColor, // Foreground (text) color
//                 //   ),
//                 //   onPressed: _generateOtp,
//                 //   child: SizedBox(
//                 //     width: 250,
//                 //     child: Center(
//                 //       child: Text(
//                 //         S.of(context).GenerateOTP,
//                 //         style: TextStyle(fontSize: 20),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // const SizedBox(height: 16),
//                 // ElevatedButton(
//                 //   style: ElevatedButton.styleFrom(
//                 //     backgroundColor: thirdColor, // Background color
//                 //     foregroundColor: secondaryColor, // Foreground (text) color
//                 //   ),
//                 //   onPressed: _googleLogin,
//                 //   child: SizedBox(
//                 //     width: 300,
//                 //     child: Row(
//                 //       mainAxisAlignment: MainAxisAlignment.center,
//                 //       children: [
//                 //         Icon(
//                 //           FontAwesomeIcons.google,
//                 //           color: primaryColor,
//                 //         ),
//                 //         SizedBox(
//                 //           width: 10,
//                 //         ),
//                 //         Text(
//                 //           S.of(context).LoginwithGoogle,
//                 //           style: TextStyle(fontSize: 20),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     Text(
//                       S.of(context).Donthavanaccount,
//                       style: TextStyle(color: secondaryColor, fontSize: 15),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => Registerscreen(),
//                           ));
//                         },
//                         child: Text(
//                           S.of(context).Register,
//                           style: TextStyle(color: thirdColor, fontSize: 18),
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _generateOtp() {
//     final random = Random();
//     _generatedOtp = (random.nextInt(9000) + 1000).toString();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: primaryColor,
//         title: Text(
//           S.of(context).YourOTP,
//           style: TextStyle(color: secondaryColor, fontSize: 25),
//         ),
//         content: Text(
//           '$_generatedOtp',
//           style: const TextStyle(color: secondaryColor, fontSize: 20),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               S.of(context).dialogAction,
//               style: TextStyle(color: secondaryColor, fontSize: 20),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _verifyOtp() async {
//     if (_otpController.text == _generatedOtp) {
//       setState(() {
//         _isLoading = true;
//       });
//       await Future.delayed(const Duration(seconds: 3));
//       setState(() {
//         _isLoading = false;
//       });
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setBool('isLoggedIn', true);
//       prefs.setString('loginType', 'phone');
//       prefs.setString('phoneNumber', _phoneNumberController.text);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const CategoryScreen()),
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           backgroundColor: primaryColor,
//           title: Row(
//             children: [
//               Text(
//                 S.of(context).Error,
//                 style: TextStyle(color: Colors.red, fontSize: 25),
//               ),
//               SizedBox(
//                 width: 8,
//               ),
//               Icon(
//                 Icons.error,
//                 color: Colors.red,
//               ),
//             ],
//           ),
//           content: Text(
//             S.of(context).InvalidOTP,
//             style: TextStyle(color: secondaryColor, fontSize: 20),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text(
//                 S.of(context).dialogAction,
//                 style: TextStyle(color: secondaryColor, fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   void _googleLogin() async {
//     GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
//     try {
//       var result = await googleSignIn.signIn();
//       if (result != null) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setBool('isLoggedIn', true);
//         prefs.setString('loginType', 'google');
//         prefs.setString('firstName', result.displayName?.split(' ')[0] ?? '');
//         prefs.setString('lastName', result.displayName?.split(' ')[1] ?? '');
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const CategoryScreen(),
//           ),
//         );
//       }
//     } catch (error) {
//       print(error);
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/screens/CategoryScreen.dart';
import 'package:sports_app/screens/RegisterScreen.dart';
import 'package:sports_app/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryScreen()),
    );
  }

  void openSignupScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUPScreen()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // image
                  Image.asset(
                    'assets/icons/balls-sports.png',
                    height: 200,
                  ),
                  // title
                  Text(
                    'SignIn',
                    style: GoogleFonts.robotoCondensed(
                      color: secondaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // subtitle
                  Text(
                    'Welcome back! Nice to see you again',
                    style: GoogleFonts.robotoCondensed(
                      color: secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  // email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: secondaryColor),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).Email,
                            hintStyle: TextStyle(color: secondaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // password
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _passwordController,
                          style: TextStyle(color: secondaryColor),
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: S.of(context).Password,
                            hintStyle: TextStyle(color: secondaryColor),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: secondaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // sign-in buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: signInWithGoogle,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: thirdColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.google,
                                    color: primaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Sign in with Google',
                                    style: GoogleFonts.robotoCondensed(
                                      color: secondaryColor,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: signIn,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: thirdColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.robotoCondensed(
                                  color: secondaryColor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 23),

                  // sign-up text button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not yet a member?',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: openSignupScreen,
                        child: Text(
                          'Sign UP Now',
                          style: TextStyle(
                            color: thirdColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
