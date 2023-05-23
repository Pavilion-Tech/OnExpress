import 'package:flutter/material.dart';
import 'package:on_express/widgets/story/story_widget.dart';

import 'models/data.dart';

class StoryScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StoryWidget(
        stories: stories,
      ),
    );
  }
}
