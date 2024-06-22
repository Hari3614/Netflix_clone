import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final String image;
  const VideoListItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),

                //right side

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                          radius: 30, backgroundImage: NetworkImage(image)),
                    ),
                    const VideoActionsWidgets(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActionsWidgets(
                        icon: Icons.add, title: 'My List'),
                    const VideoActionsWidgets(icon: Icons.send, title: 'Share'),
                    const VideoActionsWidgets(
                        icon: Icons.play_arrow, title: 'Play'),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidgets extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionsWidgets({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
