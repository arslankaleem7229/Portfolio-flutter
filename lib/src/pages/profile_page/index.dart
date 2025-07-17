import 'package:arslan/src/controllers/app_controller.dart';
import 'package:arslan/src/pages/profile_page/profile_card.dart';
import 'package:arslan/src/widgets/social_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileCard(),

          Consumer<AppController>(
            builder: (context, controller, widget) {
              return SocialGrid(buttons: controller.socialButtons);
            },
          ),
        ],
      ),
    );
  }
}
