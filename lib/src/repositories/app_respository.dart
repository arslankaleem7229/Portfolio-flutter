import 'dart:convert';

import 'package:arslan/src/models/social_button.dart';
import 'package:flutter/services.dart';

class AppRepository {
  Future<List<SocialButton>> loadSocialButtons() async {
    final jsonString = await rootBundle.loadString(
      'assets/data.json',
    );
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData
        .map((json) => SocialButton.fromJson(json))
        .toList();
  }
}
