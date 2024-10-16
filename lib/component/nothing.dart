import 'package:flutter/material.dart';

class Nothing extends StatelessWidget {
  final String message; // Variable to hold the message

  Nothing({required this.message}); // Constructor to accept message

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200, // You can adjust the height as needed
        child: Column(
          children: [
            // Cross icon to close the dialog
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
            SizedBox(height: 20), // Spacing before the message
            // Message text
            Expanded(
              child: Center(
                child: Text(
                  message, // Display the message
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Center align the text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
