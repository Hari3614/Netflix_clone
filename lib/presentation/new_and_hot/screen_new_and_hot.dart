import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_info_card.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(95),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(appBarImage), fit: BoxFit.cover)),
                ),
                kWidth,
              ],
              bottom: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: kRadius30,
                  ),
                  tabs: const [
                    Tab(
                      text: "   🍿Coming Soon   ",
                    ),
                    Tab(
                      text: "  🔥Everyone's watching  ",
                    )
                  ]),
            )),
        body: TabBarView(children: [
          buildComingSoon(),
          buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget buildComingSoon() {
    return const ComingSoonWidget();
  }

  buildEveryonesWatching() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight20,
        Text(
          "🔥Everyone's watching",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Expanded(child: EveryonesWatchingWidget()),
      ],
    );
  }
}
