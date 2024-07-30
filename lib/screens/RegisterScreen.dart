import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/screens/LoginScreen.dart';
import 'package:sports_app/utils/colors.dart';

class Registerscreen extends StatelessWidget {
  Registerscreen({super.key});
  String? email;
  String? password;
  Function(String)? onChanged;
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
                  height: 30,
                ),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.asset('assets/icons/balls-sports.png'),
                ),
                Text(
                  S.of(context).Register,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 30,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: TextField(
                    onChanged: (data) {
                      email = data;
                    },
                    style: TextStyle(color: secondaryColor),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: thirdColor),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        labelText: S.of(context).Email,
                        labelStyle: TextStyle(color: secondaryColor)),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (data) {
                    password = data;
                  },
                  style: TextStyle(color: secondaryColor),
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: thirdColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      labelText: S.of(context).Password,
                      labelStyle: TextStyle(color: secondaryColor)),
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: thirdColor, // Background color
                    foregroundColor: secondaryColor, // Foreground (text) color
                  ),
                  onPressed: () async {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email!, password: password!);
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: thirdColor,
                            showCloseIcon: true,
                            closeIconColor: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            content: Text('Weak password'),
                          ),
                        );
                      } else if (ex.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: thirdColor,
                            showCloseIcon: true,
                            closeIconColor: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            content: Text('Email already exist'),
                          ),
                        );
                      }
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: thirdColor,
                        showCloseIcon: true,
                        closeIconColor: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        content: Text('You have registered successfuly'),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: SizedBox(
                    width: 250,
                    child: Center(
                      child: Text(
                        S.of(context).Register,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      S.of(context).Havanaccount,
                      style: TextStyle(color: secondaryColor, fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          S.of(context).Login,
                          style: TextStyle(color: thirdColor, fontSize: 25),
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
}
