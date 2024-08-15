import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class login_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageWidth = screenWidth * 0.5; // 50% of screen width
    final imageHeight = screenHeight * 0.3; // 30% of screen height

    final textTopPosition =
        screenHeight * 0.4; // Position text based on screen height
    final buttonBottomPosition =
        screenHeight * 0.1; // Position button based on screen height

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    // Use WidgetsBinding to handle layout after frame has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Any code that needs to be executed after layout is done
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                left: (screenWidth - imageWidth) / 2,
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
                top: textTopPosition, // Position the "Sign In" text dynamically
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
                top: textTopPosition +
                    40, // Position the description text dynamically
                left: 0,
                right: 0,
                child: const Center(
                  child: Text(
                    "Please enter the details below to continue.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: textTopPosition +
                    100, // Position the email label dynamically
                left: 0,
                right: 0,
                child: const Text(
                  "Email",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: textTopPosition +
                    130, // Position the email text field dynamically
                left: 0,
                right: 0,
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
                top: textTopPosition +
                    190, // Position the password label dynamically
                left: 0,
                right: 0,
                child: const Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: textTopPosition +
                    220, // Position the password text field dynamically
                left: 0,
                right: 0,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ),
              Positioned(
                bottom: buttonBottomPosition, // Position the button dynamically
                left: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login logic here
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    print('Email: $email');
                    print('Password: $password');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
