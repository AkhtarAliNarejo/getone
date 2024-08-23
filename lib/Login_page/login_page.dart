import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class login_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    final imageWidth = screenWidth * 0.5; // 50% of screen width
    final imageHeight = screenHeight * 0.3; // 30% of screen height

    final textTopPosition = screenHeight * 0.4; // Adjust text top position
    final buttonBottomPosition = screenHeight * 0.1; // Position the button

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight, // Set container height to screen height
            child: Stack(
              children: [
                Positioned(
                  top: 70,
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
                  top: 90,
                  left: (screenWidth - imageWidth) / 2, // Center the image
                  child: SizedBox(
                    width: imageWidth,
                    height: imageHeight,
                    child: Image.asset(
                      'assets/login.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: textTopPosition + 30,
                  left: 0,
                  right: 0,
                  child: const Center(
                    child: Text(
                      "Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: textTopPosition + 70,
                  left: 30,
                  right: 0,
                  child: const Text(
                    "Email",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  top: textTopPosition + 105,
                  left: 30,
                  right: 30,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Positioned(
                  top: textTopPosition + 180,
                  left: 30,
                  right: 0,
                  child: const Text(
                    "Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  top: textTopPosition + 210,
                  left: 30,
                  right: 30,
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                ),
                Positioned(
                  bottom: buttonBottomPosition + 70,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Define what happens when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.30,
                          vertical: screenHeight * 0.015,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: textTopPosition + 400,
                  left: 80,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'New Here?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 8, 7, 7),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Define what happens when the button is pressed
                        },
                        child: const Text(
                          'Create an Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
