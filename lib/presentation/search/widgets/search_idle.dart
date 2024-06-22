import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/api_const.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  final Future<List<dynamic>> movies;
  const SearchIdleWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SearchTextTitle(
        title: 'Top Searches',
      ),
      const SizedBox(
        height: 10,
      ),
      FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('error is :${snapshot.error}');
          } else if (snapshot.hasData) {
            return Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    final image =
                        ApiConstants.imageBaseUrl + (movie.backDropPath ?? '');
                    final titleOfMovie = movie.orginaltitle ?? '';
                    print(image);
                    print(titleOfMovie);

                    return TopsearchItemTile(
                        imageUrl: image, title: titleOfMovie);
                  },
                  separatorBuilder: (context, index) => kheight20,
                  itemCount: snapshot.data!.length),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    ]);
  }
}

class TopsearchItemTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  const TopsearchItemTile(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 19,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
