import 'package:flutter/material.dart';
import 'package:on_express/shared/components/components.dart';

import '../../../../shared/images/images.dart';
import '../../../buyer/widgets/home/list_stories.dart';
import '../../home/highlight_screen.dart';

class HighLights extends StatelessWidget {
  const HighLights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            navigateTo(context, HighlightScreen());
          },
          child: Container(
            width: 72,height: 72,
            decoration: BoxDecoration(shape: BoxShape.circle,),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.addNo,),
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(child: ListStories()),
      ],
    );
  }
}
