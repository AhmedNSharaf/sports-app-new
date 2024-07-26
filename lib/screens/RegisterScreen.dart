import 'package:flutter/material.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/utils/colors.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

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
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  style: TextStyle(color: secondaryColor),
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
                  keyboardType: TextInputType.number,
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
