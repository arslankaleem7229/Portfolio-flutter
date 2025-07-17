import 'package:arslan/src/components/social_card_button.dart';
import 'package:arslan/src/models/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SocialGrid extends StatelessWidget {
  const SocialGrid({super.key, required this.buttons});

  final List<SocialButton> buttons;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: List.generate(
        buttons.length,
        (index) => StaggeredGridTile.count(
          crossAxisCellCount: isLandscape
              ? buttons.length - 1 == index
                    ? 3
                    : 1
              : buttons[index].rowSpan,
          mainAxisCellCount: isLandscape ? 1 : buttons[index].colSpan,
          child: SocialCardButton(button: buttons[index]),
        ),
      ),
    );
  }
}
