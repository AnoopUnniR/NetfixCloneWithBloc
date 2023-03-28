import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/home_button_navigator/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key, required this.posterpath, required this.movieName, required this.description,
  });
  final String posterpath;
  final String movieName;
  final String description;


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        sbHeightX,
        Text(
          movieName,
          style:const TextStyle(
              color: textColorW, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        sbHeightX,
         Text(
          description,
          maxLines: 4,
          style:const TextStyle(color: textColorG),
        ),
        const SizedBox(height: 50,),
        VideoWidget(imageUrl: posterpath),
        sbHeightX,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(icon: Icons.share, title: "share",
            iconSize: 20,textSize: 15),
            sbWidthX,
            CustomButtonWidget(icon: Icons.add, title: "My List",
            iconSize: 20,textSize: 15),
            sbWidthX,
            CustomButtonWidget(icon: Icons.play_arrow, title: "Play",
            iconSize: 20,textSize: 15),
            sbWidthX
          ],
        )
      ],
    );
  }
}
