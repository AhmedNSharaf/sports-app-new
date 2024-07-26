import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/screens/on_boarding_screen.dart';
import 'package:sports_app/utils/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Set the system UI to immersive mode, which hides the status and navigation bars
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Duration of the animation
      vsync: this,
    );

    // Define the animation for scaling the image
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut, // Curve for the animation
      ),
    );

    // Start the animation
    _controller.forward();

    // Schedule a function to be executed after the animation completes
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      ));
    });
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    _controller.dispose();
    // Restore the system UI to its normal state when the splash screen is disposed
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, thirdColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: child,
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/balls-sports.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  S.of(context).SplashTitle,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 30,
                    fontFamily: "Rubik",
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
