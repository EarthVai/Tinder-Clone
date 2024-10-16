import 'package:flutter/material.dart';
import 'package:tinder_clone/component/chat.dart'; // Import the new chat screen
import 'package:tinder_clone/component/chat_list.dart'; // Correct import for chat_list.dart
import 'package:tinder_clone/component/newmatch_chat.dart'; // Import the new match chat section

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //ปิดลูกศรย้อนกลับอันน่ารำคาญนั่นได้แล้วโว้ยยยยยยยกรี้ดดีแ้กหดีแ่ห้ก
        centerTitle: false,
        iconTheme: const IconThemeData(
            color: Colors.pink), // Icon color for the back button and others
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
      ),

      body: Column(
        children: [
          // New Matches section at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height:
                  220, // Define a fixed height for NewMatchChat to prevent overflow
              child: NewMatchChat(),
            ),
          ),
          const Divider(
              color: Colors
                  .grey), // A divider between New Matches and the chat list

          // Chat List below the New Matches
          Expanded(
            child: ListView.builder(
              itemCount: chats.length, // Use the chat data from chat_list.dart
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(chats[index]["image"]!),
                  ),
                  title: Text(
                    chats[index]["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Adjusted color for text
                    ),
                  ),
                  subtitle: Text(
                    chats[index]["message"]!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  onTap: () {
                    // Navigate to the detailed chat screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          userName: chats[index]["name"]!,
                          userImage: chats[index]["image"]!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor:
          Colors.white, // Set the background color for the chat screen
    );
  }
}
