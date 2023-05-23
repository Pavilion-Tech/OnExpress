import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/widgets/home/category.dart';
import 'package:on_express/modules/buyer/widgets/service/list_service.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

import '../../../../widgets/search_widget.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 219,width: 219,
          decoration: BoxDecoration(shape:BoxShape.circle,color: defaultGrey),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(Images.intro2,fit: BoxFit.cover,),
        ),
        Text(
          'Store Name',
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.location,width: 17,),
            const SizedBox(width: 10,),
            Expanded(
              child: Text(
                '26985 Brighton Lane, Lake Forest, CA 92630.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12,color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
