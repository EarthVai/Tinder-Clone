import 'dart:math';
import 'package:tinder_clone/component/userprofile.dart'; // For generating random numbers

// Declare the chats list globally
final List<Map<String, String>> chats = [
  {"name": "li_a", "message": "You have a new match!", "image": "assets/images/lia1.jpg"},
  {"name": "Yejija", "message": "Hi there!", "image": "assets/images/yeji1.jpg"},
  {"name": "Karina_boo", "message": "Nice to meet you!", "image": "assets/images/karina1.jpg"},
  {"name": "snowywinter", "message": "Nice to meet you!", "image": "assets/images/winter1.jpg"},
];

void addRandomLikedUserToChats() {
  if (likedUsers.isNotEmpty) {
    // Pick a random liked user
    UserProfile randomUser = likedUsers[Random().nextInt(likedUsers.length)];

    // Add the random liked user to the chats list
    chats.add({
      "name": randomUser.name,
      "message": "You have a new match!",
      "image": randomUser.imageUrls.isNotEmpty ? randomUser.imageUrls[0] : '', // Use the first image
    });
  }
}
