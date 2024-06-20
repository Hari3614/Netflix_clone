import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -37,
          child: BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 140,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
