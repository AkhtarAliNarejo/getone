import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class let_start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageWidth = screenWidth * 0.8; // 30% of screen width
    final imageHeight = screenHeight * 0.8; // 20% of screen height
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          child: Image.asset('assets/letstart.svg'),
          width: imageWidth,
          height: imageHeight,
        )
      ],
    ));
  }
}
