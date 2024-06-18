import 'package:flutter/material.dart';

import 'package:netflix/presentation/search/widgets/title.dart';

const ImageUrl1 =
    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg';

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
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.2 / 1.4,
            children: List.generate(20, (index) {
              return const MainCard();
            }),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(ImageUrl1),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
