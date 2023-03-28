import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class SearchTitleWidget extends StatelessWidget {
  const SearchTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: textColorW, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
