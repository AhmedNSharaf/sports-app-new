import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/screens/LoginScreen.dart';
import 'package:sports_app/utils/colors.dart';

class LoginOptionScreen extends StatelessWidget {
  const LoginOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/icons/balls-sports.png',
                height: 180,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Login Options :',
                style: GoogleFonts.robotoCondensed(
                    color: secondaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 185,
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: thirdColor,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Login With Email',
                            style: GoogleFonts.robotoCondensed(
                                color: thirdColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 210,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: thirdColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Login With Google',
                            style: GoogleFonts.robotoCondensed(
                                color: thirdColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 270,
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: thirdColor,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Login With Phone Number',
                            style: GoogleFonts.robotoCondensed(
                                color: thirdColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
