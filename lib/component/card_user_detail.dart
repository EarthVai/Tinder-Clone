import 'package:flutter/material.dart';

class CardUserDetail extends StatefulWidget {
  final String userName;
  final int age;
  final String description;
  final List<String> imageUrls;

  const CardUserDetail({super.key, 
    required this.userName,
    required this.age,
    required this.description,
    required this.imageUrls,
  });

  @override
  _CardUserDetailState createState() => _CardUserDetailState();
}

class _CardUserDetailState extends State<CardUserDetail> {
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

  // Function to pop back to the HomeScreen
  void _goBackToHomeScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8), // Space between username and age
                      Text(
                        '${widget.age}', // Age text
                        style: const TextStyle(fontSize: 22, color: Colors.grey),
                      ),
                    ],
                  ),
                  
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
                      icon: const Icon(Icons.arrow_downward, color: Colors.white),
                      onPressed: () => _goBackToHomeScreen(context), // Function to handle the button press
                    ),
                  ),
                ],
              ),
            ),
            // Image display with click functionality
            GestureDetector(
              onTapUp: (details) {
                final width = MediaQuery.of(context).size.width;
                if (details.localPosition.dx > width / 2) {
                  _showNextImage(); // Click on the right side of the image
                } else {
                  _showPreviousImage(); // Click on the left side of the image
                }
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  widget.imageUrls[_currentImageIndex],
                  width: double.infinity,
                  height: 600,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Description section with 'About me' header and description text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.format_quote, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(
                        'About me',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Share, Block, and Report buttons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      foregroundColor: Colors.black, // Black text color
                      side: const BorderSide(color: Colors.black), // Black border
                    ),
                    child: Text('Share ${widget.userName}'),
                  ),
                  const SizedBox(height: 8), // Spacing between buttons
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      foregroundColor: Colors.black, // Black text color
                      side: const BorderSide(color: Colors.black), // Black border
                    ),
                    child: Text('Block ${widget.userName}'),
                  ),
                  const SizedBox(height: 8), // Spacing between buttons
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      foregroundColor: Colors.red, // Red text color
                      side: const BorderSide(color: Colors.red), // Red border
                    ),
                    child: Text('Report ${widget.userName}'),
                  ),
                ],
              ),
            ),

            // Like and Dislike buttons similar to HomeScreen
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       _buildCircularButton(Icons.clear, Colors.red, () {
            //         // Action for dislike button
            //       }),
            //       _buildCircularButton(Icons.favorite, Colors.green, () {
            //         // Action for like button
            //       }),
            //     ],
            //   ),
            // ),

            
          ],
        ),
      ),
    );
  }

  Widget _buildCircularButton(
      IconData icon, Color color, VoidCallback onPressed) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: color,
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 30),
        onPressed: onPressed,
      ),
    );
  }
}
