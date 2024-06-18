import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    'https://media.themoviedb.org/t/p/w250_and_h141_face/qBppESpY8e97WfPWVZiU0JdRXw.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, Index) => TopsearchItemTile(),
            separatorBuilder: (context, Index) => kheight20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopsearchItemTile extends StatelessWidget {
  const TopsearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
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
