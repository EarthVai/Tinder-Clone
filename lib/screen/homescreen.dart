import 'package:flutter/material.dart';
import 'package:tinder_clone/component/swipecard.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<TinderSwipeCardState> swipeCardKey =
      GlobalKey<TinderSwipeCardState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TinderSwipeCard(key: swipeCardKey), // Use key here
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 _buildCircularButton(Icons.clear, Colors.red, () {
                  swipeCardKey.currentState?.swipeLeft(); // Call swipe left
                }),


                _buildCircularButton(Icons.refresh, Colors.orange, () {
                  swipeCardKey.currentState
                      ?.refreshCard(); // Call refresh method
                }),
               
                // _buildCircularButton(Icons.star, Colors.blue, () {
                //   // Action for super like if needed
                // }),
                _buildCircularButton(Icons.favorite, Colors.green, () {
                  swipeCardKey.currentState?.swipeRight(); // Call swipe right
                }),
                // _buildCircularButton(Icons.bolt, Colors.purple, () {
                //   // Action for boost if needed
                // }),
              ],
            ),
          ),
        ],
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
