import 'package:flutter/material.dart';

class ProfileSubscription extends StatelessWidget {
  const ProfileSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // Padding inside the container
      decoration: BoxDecoration(
        color: Colors.amber, // Inner container color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(
          color: Colors.white, // Border color
          width: 2, // Border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row with "Tinder Gold Subscription" and "Upgrade" button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tinder Gold Subscription",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  foregroundColor: Colors.amber, // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 16), // Button padding
                ),
                onPressed: () {
                  // Handle subscription action
                },
                child: const Text(
                  "Upgrade",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Spacing below the row
          _buildSubscriptionRow("See who likes you", true),
          _buildSubscriptionRow("Top Picks", true),
          _buildSubscriptionRow("Unlimited Super Likes", true),
          const SizedBox(height: 10), // Spacing below the subscription rows

          // Transparent "See all features" button
          Center(
            child: TextButton(
              onPressed: () {
                // Handle action for seeing all features
              },
              child: const Text(
                "See all features",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline, // Adds underline to text
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build rows for subscription features
  Widget _buildSubscriptionRow(String feature, bool isGoldAvailable) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(feature, style: const TextStyle(color: Colors.black)),
        isGoldAvailable
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.close, color: Colors.red),
      ],
    );
  }
}
