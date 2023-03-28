import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style:const TextStyle(
                fontSize: 30, color: textColorW, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        sbWidthX,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        sbWidthX,
      ],
    );
  }
}
