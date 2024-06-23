import 'package:flutter/material.dart';
import 'package:netflix/core/api_const.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';

import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final Future<List<dynamic>> movies;

  const NumberTitleCard({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: MainTitle(title: 'Top 10 Tv Shows In India Today'),
        ),
        FutureBuilder(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('error:${snapshot.error}');
            } else if (snapshot.hasData) {
              return LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) {
                      final movie = snapshot.data![index];
                      final image =
                          ApiConstants.imageBaseUrl + (movie.posterPath ?? '');
                      return NumberCard(
                        image: image,
                        index: index + 1,
                      );
                    },
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        kheight,
      ],
    );
  }
}
