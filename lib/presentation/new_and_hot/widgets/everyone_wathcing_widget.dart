import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_botton_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          "Friends",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          "This hit sitcom follows the merry misadvetures of six 20-somthing pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
          style: TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        kHeight30,
        VideoWidget(),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CoustomButtonWidget(
              icon: Icons.send,
              title: "Share",
              iconSize: 25,
              textSize: 14,
            ),
            kWidth,
            CoustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 14,
            ),
            kWidth,
            CoustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 14,
            ),
            kWidth
          ],
        ),
        kHeight30
      ],
    );
  }
}
