import 'package:flutter/material.dart';
import 'package:netflix/core/api_const.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/function/movie_funtion.dart';
import 'package:netflix/model/model.dart';
import 'coming_soon_info_card.dart';

ValueNotifier<List<Movie>> comingSoonNotifier = ValueNotifier([]);

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  @override
  void initState() {
    upcomimgvalues();
    super.initState();
  }

  upcomimgvalues() async {
    comingSoonNotifier.value = await getUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: comingSoonNotifier,
      builder: (context, snapshot, _) {
        if (snapshot.isEmpty) {
          return const Center(child: Text("There is no Data"));
        } else if (snapshot.isNotEmpty) {
          return Expanded(
              child: ListView.separated(
            itemCount: snapshot.length,
            separatorBuilder: (context, index) => kheight,
            itemBuilder: (context, index) {
              final movies = snapshot[index];
              final image =
                  ApiConstants.imageBaseUrl + (movies.backDropPath ?? '');
              final date = movies.releaseData;
              final title = movies.orginaltitle;
              final moviedetails = movies.overview;
              return ComingSoonInfoCard(
                imageUrl: image,
                date: date!,
                title: title!,
                details: moviedetails!,
              );
            },
          ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
