import 'dart:ui';

import 'package:arslan/src/pages/profile_page/index.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF142131), Color(0xFF000113)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 150,
                  sigmaY: 150,
                ),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFF37261).withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: 0,
              right: 0,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 500,
                  sigmaY: 500,
                ),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF842CF2).withValues(alpha: 0.6),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
            ),
            SafeArea(
              top: true,
              bottom: false,
              child: ProfileScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
