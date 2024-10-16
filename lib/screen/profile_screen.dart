import 'package:flutter/material.dart';
import 'package:tinder_clone/component/profile_feature.dart';
import 'package:tinder_clone/component/profile_setting.dart'; // Import the settings screen
import 'package:tinder_clone/component/profile_overall.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.pink), // Icon color for the back button and others
        title: const Row(
          children: [
            Icon(Icons.local_fire_department, color: Colors.red), // Fire icon
            SizedBox(width: 8), // Add some space between the icon and text
            Text(
              "tinder",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.grey[800]),
            onPressed: () {
              // Navigate to ProfileSetting when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSetting()),
              );
            },
          ),
        ],
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 50), // Space for status bar
            ProfileOverall(
              imageUrl: 'assets/images/me.jpeg',
              userName: 'nichaperth',
              userAge: 20,
              completionPercentage: 90,
            ),
            const SizedBox(height: 20),
            ProfileFeature(),
          ],
        ),
      ),
    );
  }
}
