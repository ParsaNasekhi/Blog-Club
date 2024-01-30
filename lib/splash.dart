import 'package:blog_club/onBoarding.dart';
import 'package:flutter/material.dart';
import 'gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Assets.img.background.splash.image(fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Assets.img.icons.logo.svg(
              width: 54,
              height: 54,
            ),
          ),
        ],
      ),
    );
  }
}
