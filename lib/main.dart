import 'package:flutter/material.dart';

import 'package:tinder_clone/screen/splash_screen.dart'; // Import your BottomNavigation

void main() {
  runApp(TinderClone());
}

class TinderClone extends StatelessWidget {
  const TinderClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder Clone',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Use BottomNavigation as the main widget
    );
  }
}
