import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final widgetlist = [
    const _SmartDownloadsWidget(),
    const Section2(),
    const Section3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => widgetlist[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: widgetlist.length,
      ),
    );
  }
}

class _SmartDownloadsWidget extends StatelessWidget {
  const _SmartDownloadsWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.settings, color: textColorW),
        Text(
          'Smart Downloads',
          style: TextStyle(color: textColorW),
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    final width = MediaQuery.of(context).size.width / 100;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColorW, fontWeight: FontWeight.bold, fontSize: 21),
        ),
        sbHeightX,
        const Text(
          'We\'ll download a personalised selection of\nmovies and show for you, so there\'s\nalways something to watch on your\ndevice.',
          textAlign: TextAlign.center,
          style: TextStyle(color: textColorW, fontSize: 13),
        ),
        sbHeightX,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: width * 100,
              height: width * 100,
              child: state.isLoading
                  ? const Center(child:  CircularProgressIndicator(strokeWidth: 2,))
                  : Stack(alignment: Alignment.center, children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          radius: width * 40,
                        ),
                      ),
                      DownloadsImageWidget(
                        image:
                            "$imageAppendUrl${state.downloads [0].posterPath}",
                        angle: 0.25,
                        margin: const EdgeInsets.only(left: 140),
                      ),
                      DownloadsImageWidget(
                        image:
                            "$imageAppendUrl${state.downloads[1].posterPath}",
                        angle: -0.25,
                        margin: const EdgeInsets.only(right: 140),
                      ),
                      DownloadsImageWidget(
                        image:
                            "$imageAppendUrl${state.downloads[2].posterPath}",
                        angle: 0,
                        margin: const EdgeInsets.only(right: 0),
                      )
                    ]),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            color: btnColorPurple,
            onPressed: () {},
            child: const Text(
              'Set Up',
              style: TextStyle(color: textColorW, fontSize: 20),
            ),
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          color: Colors.white,
          onPressed: () {},
          child: const Text(
            'See What you can download',
            style: TextStyle(color: textColorB, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
      required this.angle,
      required this.image,
      required this.margin});
  final String image;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        width: width * 40,
        height: width * 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
