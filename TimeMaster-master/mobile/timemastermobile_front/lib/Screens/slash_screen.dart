import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timemastermobile_front/Authentification/loginPage.dart';


import 'package:timemastermobile_front/Screens/tabs_screen.dart';
import 'package:timemastermobile_front/home-page.dart';


import 'package:timemastermobile_front/Screens/tabs_screen.dart';
import 'package:timemastermobile_front/home-page.dart';




class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Set immersive mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Initialize the animation controller for spinning
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Total duration of the animation
      vsync: this,
    )..repeat(); // Repeat the animation continuously for 5 seconds

    // Navigate to the dashboard screen after 5 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  void dispose() {
    // Restore system UI overlays
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    // Dispose of the animation controller
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Color.fromRGBO(183, 28, 28, 1)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // RotationTransition for spinning effect
            RotationTransition(
              turns: _controller,
              child: Image.asset("images/covers/loading-logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
