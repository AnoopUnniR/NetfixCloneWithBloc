import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

import 'package:netflix_clone/core/constantWidgets/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget(
      {super.key, required this.index, required this.imageurl});
  final int index;
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
            ),
            Container(
              width: 140,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: bRadiusX,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    imageurl,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 5,
          bottom: -30,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 10.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black,
                  color: textColorB,
                  fontSize: 120),
            ),
          ),
        )
      ],
    );
  }
}
