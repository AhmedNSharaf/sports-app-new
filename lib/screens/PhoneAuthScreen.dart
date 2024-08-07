import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_app/screens/CategoryScreen.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneNumber = '';
  String smsCode = '';
  String verificationId = '';
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!codeSent)
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
            if (codeSent)
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Verification Code'),
                onChanged: (value) {
                  setState(() {
                    smsCode = value;
                  });
                },
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                codeSent ? _verifyCode() : _verifyPhoneNumber();
              },
              child: Text(codeSent ? 'Login' : 'Send Code'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _navigateToCategoryScreen();
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
          this.codeSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          this.verificationId = verificationId;
        });
      },
    );
  }

  Future<void> _verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      _navigateToCategoryScreen();
    } catch (e) {
      print('Failed to sign in: $e');
    }
  }

  void _navigateToCategoryScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CategoryScreen()),
    );
  }
}
