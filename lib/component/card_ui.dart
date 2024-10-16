import 'package:flutter/material.dart';
import 'card_user_detail.dart';

class UserCard extends StatefulWidget {
  final String userName;
  final int age;
  final String description;
  final List<String> imageUrls;

  const UserCard({super.key, 
    required this.userName,
    required this.age,
    required this.description,
    required this.imageUrls,
  });

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  int _currentImageIndex = 0;

  void _showNextImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % widget.imageUrls.length;
    });
  }

  void _showPreviousImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex - 1 + widget.imageUrls.length) %
          widget.imageUrls.length;
    });
  }

  // Function to navigate to the card_user_detail screen
  void _showUserDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardUserDetail(
          userName: widget.userName,
          age: widget.age,
          description: widget.description,
          imageUrls: widget.imageUrls,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        final width = MediaQuery.of(context).size.width;
        if (details.localPosition.dx > width / 2) {
          _showNextImage(); // Click on the right side of the image
        } else {
          _showPreviousImage(); // Click on the left side of the image
        }
      },
      child: Stack(
        children: [
          // Display the current image
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
            child: Image.asset(
              widget.imageUrls[_currentImageIndex], // Show current image
              fit: BoxFit.cover,
              width: double.infinity, // Fill the card
              height: double.infinity, // Fill the card
            ),
          ),
          // Container for overlay user details with gradient background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16), // Add some padding for spacing
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent, // Transparent at the top
                    Colors.black.withOpacity(1), // Black at the bottom
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ), // Match the rounded corners of the card
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // To place elements at opposite ends
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Username and age with description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row for username and age
                      Row(
                        children: [
                          Text(
                            widget.userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8), // Space between username and age
                          Text(
                            '${widget.age}', // Age text
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  // Up-arrow button for showing user details

                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors
                          .black, // Set the background color to black with full opacity
                      border: Border.all(
                        color: Colors.white, // Set the outline color to white
                        width: 2.0, // Thickness of the white outline
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_upward, color: Colors.white),
                      onPressed:
                          _showUserDetails, // Function to handle the button press
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
