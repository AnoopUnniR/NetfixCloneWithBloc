import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot_button/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot_button/widgets/everyones_watching_widget.dart';


class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  fontSize: 30, color: textColorW, fontWeight: FontWeight.bold),
            ),
            actions: [
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
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(color: Colors.white, borderRadius: bRadius30),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: '👀 Everyone\'s Watching',
                  ),
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(
            key: Key("coming_soon"),
          ),
          EveryoneIsWatching(
            key: Key("everyone_is_watching"),
          )
        ]),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {

          if (state.isLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text(
                'error while loading list',
                style: TextStyle(color: textColorW),
              ),
            );
          } else if (state.comigingSoonList.isEmpty) {

            return const Center(
              child: Text(
                'List is empty',
                style: TextStyle(color: textColorW),
              ),
            );
          } else {

            return ListView.builder(
              itemCount: state.comigingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comigingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String day = '';
                try {
                  final date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMd('en_US').format(date);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  day = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  day = '';
                }

                return ComingSoonWidgets(
                    id: movie.id!.toString(),
                    month: month,
                    day: day,
                    posterpath: "$imageAppendUrl${movie.posterPath}",
                    movieName: movie.originalTitle ?? "no title",
                    description: movie.overview ?? "no description");
              },
            );
          }
        },
      ),
    );
  }
}

class EveryoneIsWatching extends StatelessWidget {
  const EveryoneIsWatching({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataEveryonesWatching());
      },
    );
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataEveryonesWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text(
                'error while loading list',
                style: TextStyle(color: textColorW),
              ),
            );
          } else if (state.everyoneIsWatchingList.isEmpty) {
            return const Center(
              child: Text(
                'List is empty',
                style: TextStyle(color: textColorW),
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all( 16),
              itemCount: state.everyoneIsWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyoneIsWatchingList[index];

                return EveryonesWatchingWidget(
                    posterpath: "$imageAppendUrl${tv.posterPath}",
                    movieName: tv.originalName ?? "no name",
                    description: tv.overview ?? "no descriptopn");
              },
            );
          }
        },
      ),
    );
  }
}
