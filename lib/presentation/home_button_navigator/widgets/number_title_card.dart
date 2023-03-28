import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home_button_navigator/widgets/number_card.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    super.key, required this.postersList,
  });
  final List<String> postersList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.all(10),
              child: NumberCardWidget(
                imageurl: postersList[index],
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
