import 'dart:convert';

import 'package:arslan/src/models/social_button.dart';
import 'package:flutter/services.dart';

Future<List<SocialButton>> loadSocialButtons() async {
  final jsonString = await rootBundle.loadString('assets/data.json');
  final List<dynamic> jsonData = jsonDecode(jsonString);
  return parseSocialButtons(jsonData);
}

List<SocialButton> parseSocialButtons(List<dynamic> jsonList) {
  return jsonList.map((json) => SocialButton.fromJson(json)).toList();
}
