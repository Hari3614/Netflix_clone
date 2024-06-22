import 'package:flutter/material.dart';

import 'package:netflix/core/api_const.dart';
import 'package:netflix/infrastructure/function/first_Laugh.dart';

import 'package:netflix/model/model.dart';

import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

ValueNotifier<List<Movie>> firstlaughnotifier = ValueNotifier([]);

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});

  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  @override
  void initState() {
    firstlaughnotifiervalue();
    super.initState();
  }

  firstlaughnotifiervalue() async {
    firstlaughnotifier.value = await getFirstLaugh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ValueListenableBuilder(
      valueListenable: firstlaughnotifier,
      builder: (context, snapshot, _) {
        if (snapshot.isEmpty) {
          return const Center(child: Text('No Data Found'));
        } else if (snapshot.isNotEmpty) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.length,
            itemBuilder: (context, index) {
              final movies = snapshot[index];
              final image =
                  ApiConstants.imageBaseUrl + (movies.posterPath ?? '');
              return VideoListItem(image: image);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    )));
  }
}
