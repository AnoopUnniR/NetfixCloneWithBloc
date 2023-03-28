import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constantWidgets/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 1,
          right: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.wifi,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
