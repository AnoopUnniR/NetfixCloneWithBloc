import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/home_button_navigator/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title, required this.posterList,
  });
  final String title;
  final List<String> posterList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MainTitleWidget(title: title),
          ),
          sbHeightX,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LimitedBox(
              maxHeight: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  posterList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainCardWidget(imageUrl: posterList[index]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
