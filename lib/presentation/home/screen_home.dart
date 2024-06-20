import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/main_titlr_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
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
                ListView(
                  children: [
                    const BackgroundCard(),
                    kheight,
                    const MainTitleCards(
                      title: "Released in the Past Year",
                    ),
                    kheight,
                    const MainTitleCards(
                      title: "Trending Now",
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight,
                        const MainTitle(title: "Top 10 Movies in India Today "),
                        kheight,
                        LimitedBox(
                          maxHeight: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => NumberCard(
                                index: index,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    kheight,
                    const MainTitleCards(
                      title: "Tense Dramas",
                    ),
                    kheight,
                    const MainTitleCards(
                      title: "South Indian Cinema",
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://pngimg.com/d/netflix_PNG22.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color:
                                      const Color.fromARGB(255, 41, 158, 255),
                                  child: CustomPaint(
                                    painter: SmileyPainter(),
                                  ),
                                ),
                                kWidth,
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Movies",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Categories ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}
