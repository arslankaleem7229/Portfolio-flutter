import 'package:arslan/src/models/social_button.dart';
import 'package:arslan/src/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class SocialCardButton extends StatelessWidget {
  const SocialCardButton({super.key, required this.button});

  final SocialButton button;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UrlService.launchLink(
        button.link,
        onError: (message) => UrlService.showError(context, message),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: button.colors.first,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/icons/${button.title.toLowerCase()}.png",
                      height: 45,
                      width: 45,
                      color: button.title.toLowerCase() != "linkedin"
                          ? Colors.white
                          : null,
                    ),
                  ),
                  Image.asset(
                    "assets/icons/link.png",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              button.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                wordSpacing: 1.5,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              button.subtitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
