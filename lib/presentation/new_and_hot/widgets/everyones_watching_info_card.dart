import 'package:flutter/material.dart';
import 'package:netflix/core/api_const.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/function/new_hot_funtion.dart';

import 'package:netflix/model/model.dart';

import 'package:netflix/presentation/new_and_hot/widgets/everyone_wathcing_widget.dart';

ValueNotifier<List<Movie>> everyoneWatchingNotifier = ValueNotifier([]);

class EveryonesWatchingWidget extends StatefulWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EveryonesWatchingWidget> createState() =>
      _EveryonesWatchingWidgetState();
}

class _EveryonesWatchingWidgetState extends State<EveryonesWatchingWidget> {
  @override
  void initState() {
    everyOneIsWatchingvalue();
    super.initState();
  }

  everyOneIsWatchingvalue() async {
    everyoneWatchingNotifier.value = await getEveryOneISWatching();
  }

  // Mock data for demonstration purposes
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: everyoneWatchingNotifier,
      builder: (context, snapshot, child) {
        if (snapshot.isEmpty) {
          return const Text("Data Not Found");
        } else if (snapshot.isNotEmpty) {
          return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final movie = snapshot[index];
                    final image =
                        ApiConstants.imageBaseUrl + (movie.backDropPath ?? '');
                    final details = movie.overview!;
                    final title = movie.title!;
                    final date = movie.releaseData!;
                    return EveryonesWatchingInfoCard(
                      date: date,
                      details: details,
                      image: image,
                      title: title,
                    );
                  },
                  separatorBuilder: (context, index) => kheight,
                  itemCount: snapshot.length));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
