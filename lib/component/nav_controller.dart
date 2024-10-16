import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/screen/chat_screen.dart';
import 'package:tinder_clone/screen/homescreen.dart';
import 'package:tinder_clone/screen/profile_screen.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs; // Observable for the selected index

  // List of screens
  final List<Widget> screens = [
    HomeScreen(),      // Home Screen
    ChatScreen(),      // Chat Screen
    ProfileScreen(),   // Profile Screen
  ];
}
