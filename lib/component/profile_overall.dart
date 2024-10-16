import 'package:flutter/material.dart';

class ProfileOverall extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final int userAge;
  final int completionPercentage;

  const ProfileOverall({super.key, 
    required this.imageUrl,
    required this.userName,
    required this.userAge,
    required this.completionPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center, // Center the Stack alignment
          children: [
            // Most outer CircleAvatar
            const CircleAvatar(
              backgroundColor: Colors.red, // Most outer circle color
              radius: 90, // Most outer circle radius
            ),
            // Outer CircleAvatar
            const CircleAvatar(
              backgroundColor: Colors.white, // Outer circle color
              radius: 85, // Outer circle radius
            ),
            // Profile image CircleAvatar
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl), // Profile image
              radius: 80, // Inner circle radius
            ),
            // // Edit icon CircleAvatar
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: CircleAvatar(
            //     backgroundColor: Colors.red, // Edit icon background color
            //     radius: 30, // Edit icon circle radius
            //     child: Icon(
            //       Icons.edit,
            //       size: 25,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "$userName, $userAge",
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        // SizedBox(height: 4),
        // Row(
        //   mainAxisSize: MainAxisSize.min, // Ensure the row size is just enough for the content
        //   children: [
        //     // Completion percentage display
        //     CircleAvatar(
        //       backgroundColor: Colors.redAccent, // Background color for percentage
        //       radius: 20, // Circle radius for completion percentage
        //       child: Text(
        //         "$completionPercentage%", // Display completion percentage
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
