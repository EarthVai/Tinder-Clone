import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinder_clone/component/bottom_navigation.dart';




import '../component/nothing.dart';

class LoginWithScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 254, 69, 45),
              Color.fromARGB(255, 255, 0, 123)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Move Back Arrow Icon closer to the top
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(
                        context); // Navigate back to the previous screen
                  },
                ),
              ),
            ),
            SizedBox(height: 100),

            // Tinder Logo
            Image.asset(
              'assets/images/tinder-white.png', // Replace with your logo image asset path
              height: 100,
            ),
            Text(
              'tinder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            // Terms and Conditions Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Nichapat Vaitayatanapan, Tinder Clone.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 100), // Increased space before the login buttons

            // Sign in with Apple Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Nothing(message: 'Ha Ha Nothing ');
                        },
                      );
                    },
                    icon: Icon(Icons.apple, color: Colors.black),
                    label: Text(
                      'Login with Apple',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30), // Increased spacing between buttons

            // Sign in with Facebook Button
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Nothing(message: 'Go Go next button !');
                  },
                );
              },
              icon: Icon(Icons.facebook, color: Colors.black),
              label: Text(
                'Login with Facebook',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 30), // Increased spacing between buttons

            // Sign in with Phone Number Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog first
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BottomNavigation()), // Navigate to NavigationScreen
                );
              },
              
              icon: Icon(Icons.phone, color: Colors.black),
              label: Text(
                'Login with Phone Number',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Customize as needed
                minimumSize: Size(300, 50), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
