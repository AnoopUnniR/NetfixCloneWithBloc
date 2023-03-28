import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key, required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: bRadiusX,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                imageUrl,
              ))),
    );
  }
}
