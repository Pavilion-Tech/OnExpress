import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../shared/components/components.dart';
import '../../../shared/images/images.dart';
import '../store/store_screen.dart';

class StoreAroundScreen extends StatelessWidget {
  const StoreAroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        child: ListView.separated(
            itemBuilder: (c,i)=>StoreAroundItem(),
            separatorBuilder: (c,i)=>const SizedBox(height: 20,),
            itemCount: 4
        ),
    );
  }
}

class StoreAroundItem extends StatelessWidget {
  const StoreAroundItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, StoreScreen());
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(10),
            border: Border.all(color: Colors.grey.shade400)
        ),
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              height: 46,width: 46,
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(Images.cleaning),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Store Name',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(Images.location,width: 9,),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            '3.5 Km Away',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

