import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/home_button_navigator/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    super.key, required this.id, required this.month, required this.day, required this.posterpath, required this.movieName, required this.description,
  });
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;

    return Row(
      children: [
         SizedBox(
          height: 450,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style:const TextStyle(fontSize: 16, color: textColorW),
              ),
               Text(
                day,
                style:const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: textColorW),
              )
            ],
          ),
        ),
        SizedBox(
          width: width * 100 - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               VideoWidget(imageUrl: posterpath),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      
                      style:const  TextStyle(
                        overflow: TextOverflow.ellipsis,
                          color: textColorW,
                          fontSize: 35,
                          letterSpacing: -5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                 const  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.alarm,
                        title: "Remind me",
                        iconSize: 10,
                        textSize: 10,
                      ),
                      sbWidthX,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "info",
                        iconSize: 10,
                        textSize: 10,
                      ),
                      sbWidthX
                    ],
                  )
                ],
              ),
              sbHeightX,
              Text(
                "Coming on $day $month",
                style:const  TextStyle(color: textColorG),
              ),
              sbHeightX,
              Text(
                movieName ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: textColorW,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              sbHeightX,
              Text(
               description,
               maxLines: 4,
                style: const TextStyle(color: textColorG,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
