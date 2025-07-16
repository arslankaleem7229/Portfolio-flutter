import 'package:flutter/material.dart';

class SkillTags extends StatelessWidget {
  final List<String> skills;

  const SkillTags({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: skills.map((skill) => _buildTag(skill)).toList(),
    );
  }

  Widget _buildTag(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent.withAlpha(100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.blue.shade900,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
