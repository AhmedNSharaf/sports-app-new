import 'dart:async'; // For Timer
import 'package:flutter/material.dart'; // Flutter's material design library
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Package for smooth page indicators
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/screens/LoginScreen.dart'; // Import the LoginScreen
import 'package:sports_app/screens/auth.dart';
import 'package:sports_app/utils/colors.dart'; // Import custom colors used in the app

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key}); // Constructor for the OnboardingScreen

  @override
  OnboardingScreenState createState() =>
      OnboardingScreenState(); // Creates the state for OnboardingScreen
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller =
      PageController(); // Controller for the PageView
  late Timer _timer; // Timer to handle automatic page transitions
  int _currentPage = 0; // Current page index

  @override
  void initState() {
    super.initState();
    // Start the timer to change pages automatically every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      // Update the current page index
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset to the first page after the last page
      }
      // Animate the PageView to the new page
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    _controller.dispose(); // Dispose the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, // Background color of the screen
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller, // Controller to manage the PageView
              children: [
                buildPage(
                  title: S.of(context).OnBoardingTitle1,
                  description: S.of(context).OnBoardingbody1,
                  imagePath: 'assets/icons/balls-sports.png',
                ),
                buildPage(
                  title: S.of(context).OnBoardingTitle2,
                  description: S.of(context).OnBoardingbody2,
                  imagePath: 'assets/icons/score.png',
                ),
                buildPage(
                  title: S.of(context).OnBoardingTitle3,
                  description: S.of(context).OnBoardingbody3,
                  imagePath: 'assets/icons/sports-news.png',
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller, // Controller for the SmoothPageIndicator
            count: 3, // Number of pages
            effect: const WormEffect(), // Effect used for page indicator
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(_createSlideUpRoute());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: thirdColor, // Background color of the button
                foregroundColor:
                    secondaryColor, // Foreground (text) color of the button
              ),
              child: Text(
                S.of(context).Skip,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17), // Style of the button text
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build each page in the PageView
  Widget buildPage(
      {required String title,
      required String description,
      required String imagePath}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 200, height: 200), // Image for the page
          const SizedBox(height: 32), // Space between the image and title
          Text(
            title,
            style: const TextStyle(
                fontSize: 28,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Ubuntu"), // Style for the title
          ),
          const SizedBox(height: 16), // Space between the title and description
          Text(
            description,
            textAlign: TextAlign.center, // Center-align the description text
            style: const TextStyle(
                color: secondaryColor,
                fontSize: 20,
                fontFamily: "Rubik"), // Style for the description
          ),
        ],
      ),
    );
  }

  // Method to create the custom page route with slide-up transition
  PageRouteBuilder _createSlideUpRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Auth(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start from the bottom
        const end = Offset.zero; // End at the top
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end);
        var offsetAnimation =
            animation.drive(tween.chain(CurveTween(curve: curve)));

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
