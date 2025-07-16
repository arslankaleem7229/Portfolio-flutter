import 'dart:ui';

import 'package:arslan/src/constants.dart';
import 'package:arslan/src/controllers/url_launcher.dart';
import 'package:arslan/src/models/social_button.dart';
import 'package:arslan/src/repositories/social_button.dart';
import 'package:arslan/src/widgets/avatar_image.dart';
import 'package:arslan/src/widgets/skills_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<SocialButton> buttons = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    loadSocialButtons()
        .then((buttons) {
          setState(() {
            this.buttons = buttons;
          });
        })
        .catchError((error) {
          print('Error loading social buttons: $error');
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 50,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 0.55,
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF2F3D59),
                              Color(0xFF0B1326),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        height:
                            MediaQuery.of(context).size.height * 0.45,
                        padding: EdgeInsets.only(
                          top:
                              MediaQuery.of(context).size.height *
                              0.15,
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                            Text(
                              'ARSLAN KALEEM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                wordSpacing: 1.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '@arslankaleem',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: SkillTags(skills: skills),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(child: AvatarImage()),
                ),
              ],
            ),
          ),

          if (buttons.isNotEmpty)
            StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(
                buttons.length,
                (index) => StaggeredGridTile.count(
                  crossAxisCellCount: buttons[index].rowSpan,
                  mainAxisCellCount: buttons[index].colSpan,
                  child: GestureDetector(
                    onTap: () => UrlService.launchLink(
                      context,
                      buttons[index].link,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: buttons[index].colors.first,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.2),
                                        blurRadius: 20,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    "assets/Icons/${buttons[index].title.toLowerCase()}.png",
                                    height: 45,
                                    width: 45,
                                    color:
                                        buttons[index].title
                                                .toLowerCase() !=
                                            "linkedin"
                                        ? Colors.white
                                        : null,
                                  ),
                                ),
                                Image.asset(
                                  "assets/Icons/link.png",
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            buttons[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              wordSpacing: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            buttons[index].subtitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
