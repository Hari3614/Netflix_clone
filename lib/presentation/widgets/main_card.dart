import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: kRadius10,
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
      ),
    );
  }
}
