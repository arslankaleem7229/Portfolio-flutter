import 'package:arslan/src/pages/profile_page/details_card.dart';
import 'package:arslan/src/widgets/avatar_image.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: isLandscape
          ? MediaQuery.of(context).size.height * 0.65
          : MediaQuery.of(context).size.height * 0.55,
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: isLandscape
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarImage(),
                const SizedBox(width: 20),
                Expanded(child: DetailsCard()),
              ],
            )
          : Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DetailsCard(),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(child: AvatarImage()),
                ),
              ],
            ),
    );
  }
}
