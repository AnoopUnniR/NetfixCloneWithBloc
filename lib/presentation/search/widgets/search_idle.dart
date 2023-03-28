import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const img = [
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/mqsPyyeDCBAghXyjbw4TfEYwljw.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/sa3Ku5yNVjp8NloWxJoI9dQjvOi.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/vrQHDXjVmbYzadOXQ0UaObunoy2.jpg"
];

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(
          title: 'Top Search',
        ),
        sbHeightX,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text(
                    'Error loading data',
                    style: TextStyle(color: textColorW),
                  ),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text(
                    'No data found',
                    style: TextStyle(color: textColorW),
                  ),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemsTile(
                        title: movie.title ?? "no title",
                        imageUrl: "$imageAppendUrl${movie.posterPath}");
                  },
                  separatorBuilder: (context, index) => sbHeightX,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemsTile extends StatelessWidget {
  const TopSearchItemsTile(
      {super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;

    return Row(
      children: [
        Container(
          height: 100,
          width: width * 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        sbWidthX,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(color: textColorW),
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
