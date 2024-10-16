import 'package:flutter/material.dart';
import 'package:tinder_clone/component/sent_contact_chat.dart';
import 'package:tinder_clone/component/sent_gif_chat.dart';
import 'package:tinder_clone/component/sent_music_chat.dart';

class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const ChatDetailScreen({super.key, required this.userName, required this.userImage});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hello!', 'isUserMessage': true},
    {'text': 'Hi there!', 'isUserMessage': false},
  ]; // Added dummy data to check display
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.userImage),
            ),
            const SizedBox(width: 10),
            Text(widget.userName),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          // Chat messages list
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUserMessage = messages[index]['isUserMessage']; // Check if it's a user message
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight // Align user message to the right
                        : Alignment.centerLeft, // Align received message to the left
                    child: Container(
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.pinkAccent : Colors.grey, // Set different colors
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        messages[index]['text'], // Show message text
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Add the message input at the bottom of the screen
          _buildEnhancedMessageInput(),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  // Message input field with additional buttons
  Widget _buildEnhancedMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // Text Input Field
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black), // Text color for the message
                ),
              ),
              const SizedBox(width: 8),

              // Send Button
              IconButton(
                icon: const Icon(Icons.send, color: Colors.pink),
                onPressed: () {
                  setState(() {
                    if (_controller.text.isNotEmpty) {
                      messages.add({'text': _controller.text, 'isUserMessage': true});
                      _controller.clear(); // Clear the input field after sending
                    }
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 10), // Add some space between the TextField and the buttons

          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center align buttons
            children: <Widget>[
              // Contact Button
              IconButton(
                icon: const Icon(Icons.contact_page, color: Colors.blue), // Contact icon
                onPressed: () async {
                  final selectedContact = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendContact(), // Navigate to contact sending screen
                    ),
                  );

                  // Check if a contact was selected (null if the user canceled the selection)
                  if (selectedContact != null) {
                    setState(() {
                      // Add the selected contact to the chat message list
                      messages.add({
                        'text': 'Shared contact: $selectedContact',
                        'isUserMessage': true,
                      });
                    });
                  }
                },
              ),

              // GIF Button
              IconButton(
                icon: const Icon(Icons.gif, color: Colors.blue), // GIF icon
                onPressed: () async {
                  // Navigate to GIF sending screen (implement similar to contact)
                  final selectedGIF = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendGIF(),
                    ),
                  );

                  if (selectedGIF != null) {
                    setState(() {
                      messages.add({
                        'text': 'Sent GIF: $selectedGIF',
                        'isUserMessage': true,
                      });
                    });
                  }
                },
              ),

              // Music Button
              IconButton(
                icon: const Icon(Icons.music_note, color: Colors.blue), // Music icon
                onPressed: () async {
                  // Navigate to music sending screen (implement similar to contact)
                  final selectedMusic = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SentMusic(),
                    ),
                  );

                  if (selectedMusic != null) {
                    setState(() {
                      messages.add({
                        'text': 'Sent music: $selectedMusic',
                        'isUserMessage': true,
                      });
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
