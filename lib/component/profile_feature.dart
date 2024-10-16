import 'package:flutter/material.dart';
import 'profile_subscription.dart'; // Import the subscription package

class ProfileFeature extends StatelessWidget {
  const ProfileFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 8.0),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to start
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureCard("Super Like", "0", Colors.blue),
              _buildFeatureCard("Boost", "want more?", Colors.purple),
              _buildFeatureCard("Membership", 'Upgrade', Colors.red),
            ],
          ),
          const SizedBox(height: 20), // Space between features and subscription
          ProfileSubscription(), // Include the subscription package here
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, Color color) {
    return SizedBox(  
      width: 110, // Set desired width
      height: 110, // Set desired height
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white, // Set background color
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content
          children: [
            Icon(Icons.add, color: color, size: 30), // Placeholder for icons
            Text(
              title,
              style: TextStyle(color: Colors.grey[850]),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
