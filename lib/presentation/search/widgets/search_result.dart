import 'package:flutter/material.dart';
import 'package:netflix/core/api_const.dart';
import 'package:netflix/presentation/search/screen_search.dart';

import 'package:netflix/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Movies & TV',
        ),
        const SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
          valueListenable: searchNotifier,
          builder: (context, snapshot, _) {
            if (snapshot.isEmpty) {
              return const Center(child: Text('not found'));
            } else if (snapshot.isNotEmpty) {
              return Expanded(
                  child: GridView.builder(
                itemCount: snapshot.length,
                itemBuilder: (context, index) {
                  final movies = snapshot[index];
                  final image =
                      ApiConstants.imageBaseUrl + (movies.posterPath ?? '');
                  return MainMovieCard(
                    image: image,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.4,
                  crossAxisCount: 3,
                ),
              ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
