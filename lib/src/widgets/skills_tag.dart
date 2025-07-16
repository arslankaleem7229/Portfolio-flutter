import 'package:flutter/material.dart';

class SkillTags extends StatelessWidget {
  final List<String> skills;

  const SkillTags({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.down,
      clipBehavior: Clip.hardEdge,
      crossAxisAlignment: WrapCrossAlignment.start,
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
          color: Colors.amber,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
