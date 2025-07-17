import 'dart:ui';

import 'package:flutter/material.dart';

class BottomGradient extends StatelessWidget {
  const BottomGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -50,
      left: 0,
      right: 0,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xFF842CF2).withValues(alpha: 0.6),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}

class TopGradient extends StatelessWidget {
  const TopGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -100,
      left: -100,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xFFF37261).withValues(alpha: 0.6),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
