import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart'; // Update import path

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(),
      ),
      body: Center(
        child: Text('Downloads'),
      ),
    );
  }
}
