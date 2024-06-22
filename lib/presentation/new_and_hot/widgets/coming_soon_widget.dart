import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/custom_botton_widget.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 27,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 470,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              SizedBox(height: 10), // Add space between the video and text
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "House of the\n Dragon",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CoustomButtonWidget(
                        icon: Icons.notifications,
                        title: " Remind Me",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CoustomButtonWidget(
                        icon: Icons.info_outline,
                        title: " Info",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                    ],
                  )
                ],
              ),
              kheight,
              Text(
                "Season 2 Coming Soon",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              kheight,
              Text(
                "House of the Dragon",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Text(
                "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights.",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
