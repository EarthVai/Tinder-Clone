import 'package:flutter/material.dart';
import 'package:tinder_clone/component/chat.dart';
import 'package:tinder_clone/component/userprofile.dart'; // Assuming UserProfile is defined here

class NewMatchChat extends StatelessWidget {
  const NewMatchChat({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure likedUsers only contains unique profiles using a Set or other logic
    final uniqueLikedUsers = likedUsers.toSet().toList(); // Remove duplicates
    
    return SizedBox(
      height: 100,
      child: uniqueLikedUsers.isEmpty
          ? const Center(child: Text("No new matches", style: TextStyle(color: Colors.black)))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: uniqueLikedUsers.length, // Use the unique likedUsers list
              itemBuilder: (context, index) {
                final user = uniqueLikedUsers[index];
                
                return GestureDetector(
                  onTap: () {
                    // Navigate to the chat screen of the selected user
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          userName: user.name,
                          userImage: user.imageUrls.isNotEmpty ? user.imageUrls[0] : '', // Use the first image
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners for the image
                          child: Image.asset(
                            user.imageUrls.isNotEmpty ? user.imageUrls[0] : '', // Use the first image
                            width: 120,  // Set the width for the rectangle (adjust size as needed)
                            height: 180, // Set the height for the rectangle (adjust size as needed)
                            fit: BoxFit.cover, // Ensure the image fits properly
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          user.name, // Use name from UserProfile
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
