import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/function/movie_funtion.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/presentation/home/widgets/custom_botton_widget.dart';
import 'package:netflix/presentation/home/widgets/numbyr_title_card.dart';
import 'package:netflix/presentation/home/widgets/play_button.dart';
import 'package:netflix/presentation/widgets/main_titlr_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> horrorMovies;
  late Future<List<Movie>> comedyMovies;
  late Future<List<Movie>> actionMovies;
  late Future<List<Movie>> upComingMovies;

  @override
  void initState() {
    trendingMovies = getTrendingMovies();
    horrorMovies = getHorrorMovies();
    comedyMovies = getComedyMovies();
    actionMovies = getActionMovies();
    upComingMovies = getUpComingMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext, context, index) {
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
                    Column(
                      children: [
                        const HomeBackgroundCard(),
                        MainTitleCard(
                          movies: trendingMovies,
                          title: "Trending Movies",
                        ),
                        kheight,
                        MainTitleCard(
                          movies: horrorMovies,
                          title: 'Horror Movies',
                        ),
                        kheight,
                        NumberTitleCard(movies: upComingMovies),
                        kheight,
                        MainTitleCard(
                          movies: comedyMovies,
                          title: 'Comedy Movies',
                        ),
                        kheight,
                        MainTitleCard(
                          movies: actionMovies,
                          title: 'Action films',
                        )
                      ],
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 6000),
                        width: double.infinity,
                        height: 80,
                        color: Colors.black.withOpacity(0.6),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                kWidth,
                                const Image(
                                  image: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/017/396/804/non_2x/netflix-mobile-application-logo-free-png.png'),
                                  width: 45,
                                  height: 45,
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
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(appBarImage),
                                          fit: BoxFit.cover)),
                                ),
                                kheight,
                                kWidth,
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: textStyle,
                                ),
                                Text(
                                  "Movies",
                                  style: textStyle,
                                ),
                                Text(
                                  'Categories',
                                  style: textStyle,
                                )
                              ],
                            )
                          ],
                        ))
                    : kheight
              ],
            ),
          );
        },
      ),
    ));
  }
}

class HomeBackgroundCard extends StatelessWidget {
  const HomeBackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(kMainimage), fit: BoxFit.cover)),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CoustomButtonWidget(icon: Icons.add, title: 'My List '),
                PlayButton(),
                CoustomButtonWidget(icon: Icons.info_outline, title: 'Info'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
