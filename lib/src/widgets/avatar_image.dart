import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: Color(0xFFFFB928),
        image: DecorationImage(
          image: AssetImage("assets/avatar.png"),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
