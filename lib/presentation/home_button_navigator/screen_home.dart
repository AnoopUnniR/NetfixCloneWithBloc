import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/home_button_navigator/widgets/background_card_widget.dart';
import 'package:netflix_clone/presentation/home_button_navigator/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, index, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.hasError) {
                      return const Center(
                          child: Text(
                        "Error while getting data",
                        style: TextStyle(color: textColorW),
                      ));
                    }

                    //released past year
                    final releasesPastYear = state.pastYearMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();

                    //trending
                    final trending = state.trendingMovieslist.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    //tensed dramas
                    final dramas = state.tenseDramasMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    //south indian moviess
                    final southIndian = state.southIndianMovieList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    //top 10 tv shows
                    final top10 = state.trendingTvList.map((m) {
                      return "$imageAppendUrl${m.posterPath}";
                    }).toList();
                    return ListView(
                      children: [
                        const BackgroundCard(),
                        MainTitleCard(
                          title: "Released in the past year",
                          posterList: releasesPastYear,
                        ),
                        MainTitleCard(
                          title: "Trending Now",
                          posterList: trending,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: MainTitleWidget(
                              title: "Top 10 TV Shows In India Today"),
                        ),
                        sbHeightX,
                        NumberTitleCardWidget(postersList: top10),
                        MainTitleCard(
                          title: "Tense Dramas",
                          posterList: dramas,
                        ),
                        MainTitleCard(
                          title: "South Indian Cinemas",
                          posterList: southIndian,
                        ),
                        sbHeightX,
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        color: Colors.black.withOpacity(0.3),
                        width: double.infinity,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    netflixlogo,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                sbWidthX,
                                Container(
                                  color: Colors.blue,
                                  width: 30,
                                  height: 30,
                                )
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: homeNavText,
                                ),
                                Text(
                                  'Movies',
                                  style: homeNavText,
                                ),
                                Text(
                                  'Catagories',
                                  style: homeNavText,
                                ),
                              ],
                            )
                          ]),
                        ),
                      )
                    : sbHeightX
              ],
            ),
          );
        },
      ),
    );
  }
}
