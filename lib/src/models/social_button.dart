import 'package:flutter/material.dart';

class SocialButton {
  final String title;
  final String subtitle;
  final int rowSpan;
  final int colSpan;
  final List<Color> colors;
  final String link;

  SocialButton({
    required this.title,
    required this.subtitle,
    required this.rowSpan,
    required this.colSpan,
    required this.colors,
    required this.link,
  });

  factory SocialButton.fromJson(Map<String, dynamic> json) {
    List<dynamic> colorStrings = json['colors'] ?? [];
    List<Color> colors = colorStrings.map<Color>((c) {
      return Color(
        int.parse(c.toString().replaceFirst('0x', '0xff')),
      );
    }).toList();

    return SocialButton(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      rowSpan: json['rowSpan'] ?? 1,
      colSpan: json['colSpan'] ?? 1,
      colors: colors,
      link: json['link'] ?? '',
    );
  }
}
