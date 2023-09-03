import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(right: -50,
          top: -50,
              child: Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
          )),

          Center(child: const Image(image: AssetImage('images/logo.png'))),
          
          Positioned(bottom: -30,
          left: -100,
              child: Container(
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
          ))
        ],
      ),
    );
  }
}
