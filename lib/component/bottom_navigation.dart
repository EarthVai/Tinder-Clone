import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/component/nav_controller.dart';


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]), // Use Obx to reactively display screens
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: controller.selectedIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department, color: Colors.pink),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.pink),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.pink),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          controller.selectedIndex.value = index; // Update selected index
        },
      ),
    );
  }
}
