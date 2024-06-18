import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final _widgetList = [
      const _SmartDownloads(),
      const Section2(),
      const Section3(),
    ];

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 23,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  final List<String> imageList = const [
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/luoKpgVwi1E5nQsi7W0UuKHu2Rq.jpg",
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/2zmTngn1tYC1AvfnrFLhxeD82hz.jpg",
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhitecolor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "We'll download a personalised selection of\nmovies and shows for you, so there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.39,
              ),
              DowloadsImageWidgets(
                imageList: imageList[0],
                margin: const EdgeInsets.only(
                  left: 170,
                  top: 20,
                ),
                angle: 25,
                size: Size(
                  size.width * 0.35,
                  size.width * 0.55,
                ),
              ),
              DowloadsImageWidgets(
                imageList: imageList[1],
                margin: const EdgeInsets.only(
                  right: 170,
                  top: 20,
                ),
                angle: -25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DowloadsImageWidgets(
                radius: 8,
                imageList: imageList[2],
                margin: const EdgeInsets.only(
                  bottom: 10,
                  top: 20,
                ),
                size: Size(size.width * 0.4, size.width * 0.6),
              )
            ],
          ),
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
            color: KButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                  color: kWhitecolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          color: KButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See What You Can Download",
              style: TextStyle(
                color: KcolorBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(Icons.settings, color: kWhitecolor),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DowloadsImageWidgets extends StatelessWidget {
  const DowloadsImageWidgets(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
