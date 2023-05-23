import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';

import '../../../../shared/components/components.dart';
import '../../../../widgets/story/story_screen.dart';

class ListStories extends StatelessWidget {
  const ListStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
          itemBuilder: (c,i)=>itemBuilder(context),
          padding: EdgeInsets.zero,
          separatorBuilder: (c,i)=>const SizedBox(width: 5,),
          scrollDirection: Axis.horizontal,
          itemCount: 5
      ),
    );
  }

  Widget itemBuilder(BuildContext context){
    return InkWell(
      onTap: ()=>navigateTo(context, StoryScreen()),
      child: Container(
        width: 72,height: 72,
        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(Images.intro2,fit: BoxFit.cover,),
      ),
    );
  }
}
