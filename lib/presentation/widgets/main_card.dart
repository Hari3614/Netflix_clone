import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard1 extends StatelessWidget {
  const MainCard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg',
          ),
        ),
      ),
    );
  }
}
