import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class let_start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageWidth = screenWidth * 0.5; // 50% of screen width
    final imageHeight = screenHeight * 0.3; // 30% of screen height

    final textTopPosition = screenHeight *
        0.4; // Adjust text top position as a percentage of screen height
    final buttonBottomPosition = screenHeight *
        0.1; // Position the button 10% from the bottom of the screen

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70, // Keep this fixed if you prefer
            right: 20,
            child: TextButton(
              onPressed: () {
                // Define what happens when the button is pressed
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 7, 7),
                ),
              ),
            ),
          ),
          Positioned(
            top: 90, // Keep this fixed if you prefer
            left:
                (screenWidth - imageWidth) / 2, // Center the image horizontally
            child: SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: Image.asset(
                'assets/3.png',
                fit: BoxFit.contain, // Adjust the image to fit within the box
              ),
            ),
          ),
          Positioned(
            top: textTopPosition + 30, // Position the first text dynamically
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Get Your Order\nSafely",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: textTopPosition + 120, // Position the second text dynamically
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Our app makes it easier than \n ever to discover and buy the \nbest product on the market.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            bottom:
                buttonBottomPosition + 50, // Position the button dynamically
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Define what happens when the button is pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth *
                        0.15, // 15% of screen width for horizontal padding
                    vertical: screenHeight *
                        0.02, // 2% of screen height for vertical padding
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Let's Start",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
