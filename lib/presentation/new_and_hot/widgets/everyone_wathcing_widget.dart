import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_botton_widget.dart';

import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({
    super.key,
    required this.image,
    required this.date,
    required this.details,
    required this.title,
  });
  final String image;
  final String date;

  final String details;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE,
          VideoWidget(
            videoImage: image,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CoustomButtonWidget(
                  icon: Icons.share,
                  title: 'Share',
                ),
                kWidth,
                CoustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                kWidth,
                CoustomButtonWidget(
                  icon: Icons.play_arrow,
                  title: "Play",
                ),
                kWidth,
              ],
            ),
          ),
          kheight,
          Text(
            // movieInfo.originalTitle ??
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kheight,
          Text(
            details,
            // movieInfo.overview,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
