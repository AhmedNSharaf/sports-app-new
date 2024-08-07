// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sports_app/generated/l10n.dart';
// import 'package:sports_app/utils/colors.dart';

// // ignore: must_be_immutable
// class Registerscreen extends StatelessWidget {
//   Registerscreen({super.key});
//   String? email;
//   String? password;
//   Function(String)? onChanged;
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
//                   height: 30,
//                 ),
//                 SizedBox(
//                   height: 180,
//                   width: 180,
//                   child: Image.asset('assets/icons/balls-sports.png'),
//                 ),
//                 Text(
//                   S.of(context).Register,
//                   style: TextStyle(
//                     color: secondaryColor,
//                     fontSize: 30,
//                     fontFamily: 'Ubuntu',
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   child: TextField(
//                     onChanged: (data) {
//                       email = data;
//                     },
//                     style: TextStyle(color: secondaryColor),
//                     decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: thirdColor),
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: secondaryColor,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                         ),
//                         labelText: S.of(context).Email,
//                         labelStyle: TextStyle(color: secondaryColor)),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextField(
//                   onChanged: (data) {
//                     password = data;
//                   },
//                   style: TextStyle(color: secondaryColor),
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: thirdColor),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: secondaryColor),
//                         borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                       ),
//                       labelText: S.of(context).Password,
//                       labelStyle: TextStyle(color: secondaryColor)),
//                   keyboardType: TextInputType.multiline,
//                 ),
//                 const SizedBox(height: 30),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: thirdColor, // Background color
//                     foregroundColor: secondaryColor, // Foreground (text) color
//                   ),
//                   onPressed: () async {
//                     try {
//                       UserCredential user = await FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
//                               email: email!, password: password!);
//                     } on FirebaseAuthException catch (ex) {
//                       if (ex.code == 'weak-password') {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             backgroundColor: thirdColor,
//                             showCloseIcon: true,
//                             closeIconColor: Colors.amber,
//                             padding: EdgeInsets.symmetric(horizontal: 15),
//                             content: Text('Weak password'),
//                           ),
//                         );
//                       } else if (ex.code == 'email-already-in-use') {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             backgroundColor: thirdColor,
//                             showCloseIcon: true,
//                             closeIconColor: Colors.amber,
//                             padding: EdgeInsets.symmetric(horizontal: 15),
//                             content: Text('Email already exist'),
//                           ),
//                         );
//                       }
//                     }
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         backgroundColor: thirdColor,
//                         showCloseIcon: true,
//                         closeIconColor: Colors.amber,
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                         content: Text('You have registered successfuly'),
//                       ),
//                     );
//                     Navigator.of(context).pop();
//                   },
//                   child: SizedBox(
//                     width: 250,
//                     child: Center(
//                       child: Text(
//                         S.of(context).Register,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     Text(
//                       S.of(context).Havanaccount,
//                       style: TextStyle(color: secondaryColor, fontSize: 20),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Text(
//                           S.of(context).Login,
//                           style: TextStyle(color: thirdColor, fontSize: 25),
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
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/screens/auth.dart';
import 'package:sports_app/utils/colors.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final _emailController = TextEditingController();
  final _PasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _PasswordController.text.trim());
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Auth()));
    }
  }

  bool passwordConfirmed() {
    return _PasswordController.text.trim() ==
        _confirmPasswordController.text.trim();
  }

  void openSigninScreen() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _PasswordController.dispose();
    _confirmPasswordController.dispose();
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
                    'SignUP',
                    style: GoogleFonts.robotoCondensed(
                        color: secondaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  // subtitle
                  Text(
                    'Welcome! Nice to see you here. You can sign up below.',
                    style: GoogleFonts.robotoCondensed(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: secondaryColor),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(color: secondaryColor)),
                        ),
                      ),
                    ),
                  ),
                  //password
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _PasswordController,
                          style: TextStyle(color: secondaryColor),
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
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
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //confirm password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _confirmPasswordController,
                          style: TextStyle(color: secondaryColor),
                          obscureText: !_isConfirmPasswordVisible,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: secondaryColor),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: secondaryColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible =
                                        !_isConfirmPasswordVisible;
                                  });
                                },
                              )),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  //signup button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: signUp,
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          'Sign up',
                          style: GoogleFonts.robotoCondensed(
                              color: secondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // forgot password text button
                  TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password Screen
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: thirdColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // signup text button

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account?',
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: openSigninScreen,
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: thirdColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
