import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/widgets/default_button.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../../shared/images/images.dart';
import '../../../../../shared/styles/colors.dart';
import 'edit_service_screen.dart';

class VendorServiceScreen extends StatelessWidget {
  const VendorServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      titleAppbar: 'Home Cleaning',
      haveNotification: false,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,height: 184,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(25),
                    color: Colors.black
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(Images.product2,fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,bottom: 5),
                child: Text(
                  'Name Of Provider',
                  style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    allowHalfRating: true,
                    unratedColor: Colors.grey,
                    ignoreGestures: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, index) {
                      if (5 > index) {
                        return Image.asset(Images.star);
                      } else {
                        return Image.asset(Images.star,color: Colors.grey,);
                      }
                    },
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(width: 7,),
                  Text(
                    '5.00',
                    style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0,bottom: 30),
                child: Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting
industry. Lorem Ipsum has been the industry's standard dummy
text ever since the 1500s, when an unknown printer took a galley
of type and scrambled it to make.''',
                  style: TextStyle(fontSize: 16,height: 1.7,color: Colors.grey.shade700),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  tr('review'),
                  style: TextStyle(fontSize: 15,height: 1.7,color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (c,i)=>ReviewItem(),
                    separatorBuilder: (c,i)=>const SizedBox(height: 20,),
                    itemCount: 5
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    text: tr('delete'),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 30,),
                Expanded(
                  child: DefaultButton(
                    onTap: (){
                      navigateTo(context, EditServiceScreen());
                    },
                    text: tr('edit'),
                    color: Colors.white,
                    textColor: defaultColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Reviewer Name',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
              ),
            ),
            RatingBar.builder(
              initialRating: 5,
              itemSize: 8,
              direction: Axis.horizontal,
              itemCount: 5,
              allowHalfRating: true,
              unratedColor: Colors.grey,
              ignoreGestures: true,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, index) {
                if (5 > index) {
                  return Image.asset(Images.star);
                } else {
                  return Image.asset(Images.star,color: Colors.grey,);
                }
              },
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting
industry. Lorem Ipsum has been the industry's standard dummy
text ever since the 1500s, when an unknown printer took a galley
of type and scrambled it to make.''',
            style: TextStyle(fontSize: 12,height: 1.7,color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}

