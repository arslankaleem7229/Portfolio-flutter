import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future<void> launchLink(
    BuildContext context,
    String url,
  ) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        _showError(context, 'Could not open the link.');
      }
    } else {
      _showError(context, 'Invalid URL.');
    }
  }

  static void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
